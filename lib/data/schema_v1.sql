-- settings
CREATE TABLE IF NOT EXISTS settings (
  id INTEGER PRIMARY KEY CHECK (id = 1),
  locale TEXT,
  pin_enabled INTEGER DEFAULT 0,
  biometric_enabled INTEGER DEFAULT 0,
  quiet_hours TEXT,
  sensitive_mode INTEGER DEFAULT 0,
  export_path TEXT
);

-- checkins
CREATE TABLE IF NOT EXISTS checkins (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ts INTEGER NOT NULL,
  mood_tag TEXT NOT NULL,
  intensity INTEGER NOT NULL CHECK (intensity BETWEEN 0 AND 10),
  context_tags TEXT,
  note_cipher BLOB,
  risk_score INTEGER DEFAULT 0,
  flags TEXT
);
CREATE INDEX IF NOT EXISTS idx_checkins_ts ON checkins(ts DESC);
CREATE INDEX IF NOT EXISTS idx_checkins_intensity ON checkins(intensity);

-- sessions
CREATE TABLE IF NOT EXISTS sessions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  type TEXT NOT NULL,
  ts_start INTEGER NOT NULL,
  ts_end INTEGER,
  outcome TEXT
);

-- actions
CREATE TABLE IF NOT EXISTS actions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title_key TEXT NOT NULL,
  context TEXT,
  preset INTEGER DEFAULT 0
);

-- action_logs
CREATE TABLE IF NOT EXISTS action_logs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  action_id INTEGER NOT NULL,
  ts_done INTEGER NOT NULL,
  FOREIGN KEY(action_id) REFERENCES actions(id)
);

-- alerts
CREATE TABLE IF NOT EXISTS alerts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ts INTEGER NOT NULL,
  level TEXT NOT NULL,
  signals TEXT NOT NULL,
  ack INTEGER DEFAULT 0
);

-- audio_tracks
CREATE TABLE IF NOT EXISTS audio_tracks (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title_key TEXT NOT NULL,
  file_path TEXT NOT NULL,
  duration INTEGER,
  category TEXT
);

