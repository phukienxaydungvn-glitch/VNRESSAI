#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

use std::process::Command;

fn bootstrap_services() {
    let _ = Command::new("python")
        .args(["-m", "uvicorn", "app.main:app", "--host", "127.0.0.1", "--port", "8001"])
        .current_dir("../../services/api_fastapi")
        .spawn();

    let _ = Command::new("node")
        .arg("src/server.js")
        .current_dir("../../services/api_node")
        .spawn();
}

fn main() {
    bootstrap_services();

    tauri::Builder::default()
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
