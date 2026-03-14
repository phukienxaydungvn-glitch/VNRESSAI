-- TREND RADAR AI schema (153 tables)
PRAGMA foreign_keys = ON;


CREATE TABLE users (
  id TEXT PRIMARY KEY,
  email TEXT UNIQUE NOT NULL,
  full_name TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE projects (
  id TEXT PRIMARY KEY,
  user_id TEXT NOT NULL,
  name TEXT NOT NULL,
  niche TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(user_id) REFERENCES users(id)
);
CREATE TABLE keywords (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  keyword TEXT NOT NULL,
  language TEXT DEFAULT 'vi',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE keyword_metrics (
  id TEXT PRIMARY KEY,
  keyword_id TEXT NOT NULL,
  search_volume INTEGER,
  keyword_difficulty REAL,
  trend_score REAL,
  competition_level REAL,
  cpc_estimate REAL,
  measured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(keyword_id) REFERENCES keywords(id)
);
CREATE TABLE keyword_trend (
  id TEXT PRIMARY KEY,
  keyword_id TEXT NOT NULL,
  bucket_date DATE,
  score REAL,
  FOREIGN KEY(keyword_id) REFERENCES keywords(id)
);
CREATE TABLE trend_topics (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  topic TEXT NOT NULL,
  growth_rate REAL,
  viral_score REAL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE social_posts (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  platform TEXT,
  author TEXT,
  content TEXT,
  hashtags TEXT,
  views INTEGER,
  likes INTEGER,
  shares INTEGER,
  comments INTEGER,
  posted_at DATETIME,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE ai_contents (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  content_type TEXT,
  title TEXT,
  body TEXT,
  seo_meta_description TEXT,
  faq_schema_json TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE content_campaigns (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  name TEXT,
  channel TEXT,
  status TEXT,
  scheduled_at DATETIME,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE automation_tasks (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  pipeline_name TEXT,
  stage TEXT,
  status TEXT,
  payload_json TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE crawler_jobs (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  source TEXT,
  query TEXT,
  status TEXT,
  started_at DATETIME,
  finished_at DATETIME,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE seo_analysis (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  url TEXT,
  score REAL,
  technical_issues_json TEXT,
  content_issues_json TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE competitor_domains (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  domain TEXT,
  authority_score REAL,
  traffic_estimate INTEGER,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE content_gap (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  competitor_domain_id TEXT,
  keyword TEXT,
  opportunity_score REAL,
  FOREIGN KEY(project_id) REFERENCES projects(id),
  FOREIGN KEY(competitor_domain_id) REFERENCES competitor_domains(id)
);
CREATE TABLE viral_content (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  source_url TEXT,
  topic TEXT,
  viral_score REAL,
  trend_score REAL,
  engagement_score REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE pipeline_runs (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  run_date DATETIME,
  status TEXT,
  report_json TEXT,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE model_registry (
  id TEXT PRIMARY KEY,
  provider TEXT,
  model_name TEXT,
  task_type TEXT,
  enabled INTEGER DEFAULT 1
);

CREATE TABLE metric_snapshot_001 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_002 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_003 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_004 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_005 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_006 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_007 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_008 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_009 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_010 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_011 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_012 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_013 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_014 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_015 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_016 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_017 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_018 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_019 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_020 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_021 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_022 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_023 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_024 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_025 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_026 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_027 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_028 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_029 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_030 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_031 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_032 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_033 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_034 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_035 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_036 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_037 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_038 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_039 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_040 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_041 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_042 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_043 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_044 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_045 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_046 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_047 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_048 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_049 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_050 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_051 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_052 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_053 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_054 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_055 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_056 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_057 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_058 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_059 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_060 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_061 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_062 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_063 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_064 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_065 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_066 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_067 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_068 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_069 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_070 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_071 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_072 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_073 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_074 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_075 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_076 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_077 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_078 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_079 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_080 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_081 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_082 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_083 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_084 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_085 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_086 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_087 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_088 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_089 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_090 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_091 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_092 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_093 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_094 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_095 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_096 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_097 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_098 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_099 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_100 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_101 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_102 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_103 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_104 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_105 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_106 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_107 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_108 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_109 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_110 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_111 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_112 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_113 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_114 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_115 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_116 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_117 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_118 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_119 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_120 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_121 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_122 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_123 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_124 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_125 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_126 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_127 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_128 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_129 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_130 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_131 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_132 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_133 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_134 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
CREATE TABLE metric_snapshot_135 (
  id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL,
  metric_key TEXT,
  metric_value REAL,
  captured_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(project_id) REFERENCES projects(id)
);


CREATE INDEX idx_keywords_project ON keywords(project_id);
CREATE INDEX idx_keyword_metrics_keyword ON keyword_metrics(keyword_id);
CREATE INDEX idx_trend_topics_project ON trend_topics(project_id);
CREATE INDEX idx_social_posts_project ON social_posts(project_id);
CREATE INDEX idx_viral_content_project ON viral_content(project_id);
