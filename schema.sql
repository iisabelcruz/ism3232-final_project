-- Coral Bay Hospital Revenue Cycle Desk (synthetic data, no real patients)

CREATE TABLE IF NOT EXISTS claims (
    claim_id       TEXT PRIMARY KEY,
    payer          TEXT NOT NULL,
    service_line   TEXT NOT NULL,
    submitted_date TEXT NOT NULL,
    total_billed   REAL NOT NULL,
    paid_amount    REAL NOT NULL,
    status         TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS denials (
    denial_id     TEXT PRIMARY KEY,
    claim_id      TEXT NOT NULL,
    reason_code   TEXT NOT NULL,
    reason        TEXT NOT NULL,
    denied_amount REAL NOT NULL,
    denial_date   TEXT NOT NULL,
    FOREIGN KEY (claim_id) REFERENCES claims (claim_id)
);

CREATE TABLE IF NOT EXISTS change_requests (
    number    INTEGER PRIMARY KEY AUTOINCREMENT,
    claim_id  TEXT NOT NULL,
    new_value TEXT NOT NULL,
    status    TEXT NOT NULL DEFAULT 'waiting'
);

-- Pattern baked in: Sunrise Health denies cardiology claims for no authorization.
INSERT OR IGNORE INTO claims VALUES ('C1001', 'Medicare',          'cardiology',  '2026-10-03', 4200.00, 3360.00, 'paid');
INSERT OR IGNORE INTO claims VALUES ('C1002', 'Sunrise Health',    'cardiology',  '2026-10-10', 6800.00,    0.00, 'denied');
INSERT OR IGNORE INTO claims VALUES ('C1003', 'Sunrise Health',    'cardiology',  '2026-10-18', 5200.00,    0.00, 'denied');
INSERT OR IGNORE INTO claims VALUES ('C1004', 'Medicaid',          'ED',          '2026-10-21', 1500.00, 1100.00, 'paid');
INSERT OR IGNORE INTO claims VALUES ('C1005', 'BlueShield Sample', 'orthopedics', '2026-11-02', 9400.00, 7050.00, 'partial');
INSERT OR IGNORE INTO claims VALUES ('C1006', 'Sunrise Health',    'cardiology',  '2026-11-04', 7300.00,    0.00, 'denied');
INSERT OR IGNORE INTO claims VALUES ('C1007', 'Medicare',          'radiology',   '2026-11-09',  900.00,  720.00, 'paid');
INSERT OR IGNORE INTO claims VALUES ('C1008', 'BlueShield Sample', 'ED',          '2026-11-12', 2100.00,    0.00, 'submitted');
INSERT OR IGNORE INTO claims VALUES ('C1009', 'Medicaid',          'orthopedics', '2026-11-14', 3300.00,    0.00, 'denied');

INSERT OR IGNORE INTO denials VALUES ('D2001', 'C1002', 'CO-197', 'No authorization',        6800.00, '2026-10-24');
INSERT OR IGNORE INTO denials VALUES ('D2002', 'C1003', 'CO-197', 'No authorization',        5200.00, '2026-11-01');
INSERT OR IGNORE INTO denials VALUES ('D2003', 'C1006', 'CO-197', 'No authorization',        7300.00, '2026-11-18');
INSERT OR IGNORE INTO denials VALUES ('D2004', 'C1009', 'CO-16',  'Missing information',     3300.00, '2026-11-20');
INSERT OR IGNORE INTO denials VALUES ('D2005', 'C1005', 'CO-50',  'Not medically necessary', 2350.00, '2026-11-08');