-- Copyright (C) 2025  A. Iooss
-- SPDX-License-Identifier: GPL-2.0-or-later
CREATE TABLE IF NOT EXISTS filedata (
    sha256 BLOB PRIMARY KEY,
    sz INT,
    data BLOB
);
