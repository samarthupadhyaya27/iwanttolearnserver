const db = require('../db.js');

afterAll(async () => {
    await db.end();
});

test("Connection", async () => {
    expect((await db.query("SELECT 'TEST' AS MESSAGE")).rows[0].message).toBe('TEST');
});