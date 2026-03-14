import express from "express";
import { Queue } from "bullmq";
import IORedis from "ioredis";

const app = express();
app.use(express.json());

const connection = new IORedis(process.env.REDIS_URL || "redis://127.0.0.1:6379", {
  maxRetriesPerRequest: null,
});

const automationQueue = new Queue("automation-pipeline", { connection });

app.get("/health", (_, res) => {
  res.json({ status: "ok", service: "node-orchestrator" });
});

app.post("/api/v1/automation/pipelines/run", async (req, res) => {
  const job = await automationQueue.add("full-pipeline", req.body, {
    attempts: 3,
    backoff: { type: "exponential", delay: 1000 },
  });
  res.json({ jobId: job.id, status: "queued" });
});

app.get("/api/v1/automation/tasks", async (_, res) => {
  const jobs = await automationQueue.getJobs(["waiting", "active", "completed", "failed"]);
  res.json(
    jobs.slice(0, 30).map((j) => ({ id: j.id, name: j.name, data: j.data, state: j.finishedOn ? "completed" : "running" }))
  );
});

app.listen(8002, () => {
  console.log("Node orchestrator listening on :8002");
});
