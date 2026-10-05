CREATE TABLE Uzytkownik (
    Id       INTEGER PRIMARY KEY,
    Imie     TEXT    NOT NULL,
    Nazwisko TEXT    NOT NULL,
    Wiek     INTEGER,
    Email    TEXT    NOT NULL
                     CHECK (length(trim(Email) ) > 0),
    CONSTRAINT UQ_Uzytkownik_Email UNIQUE (
        Email
    )
)
STRICT;

CREATE TABLE Profil_uzytkownika (
    Id              INTEGER PRIMARY KEY,
    Kondycja        INTEGER NOT NULL
                            CHECK (Kondycja BETWEEN 1 AND 5),
    CzyzDzieckiem   INTEGER NOT NULL
                            CHECK (CzyzDzieckiem IN (0, 1) ),
    MaxLiczbaGodzin REAL    NOT NULL
                            CHECK (MaxLiczbaGodzin > 0),
    Doswiadczenie   INTEGER NOT NULL
                            CHECK (Kondycja BETWEEN 1 AND 5),
    IdUzytkownika   INTEGER NOT NULL,
    CONSTRAINT FK_Profil_uzytkownika_Uzytkownik FOREIGN KEY (
        IdUzytkownika
    )
    REFERENCES Uzytkownik (Id)  ON UPDATE CASCADE ON DELETE CASCADE,
     CONSTRAINT UQ_ProfilUzytkownika_Uzytkownik UNIQUE (
        IdUzytkownika
    )
) STRICT;

CREATE TABLE Szlaki(
    Id INTEGER PRIMARY KEY,
    Nazwa TEXT NOT NULL,
    KolorSzlaku TEXT NOT NULL,
    DlugoscKm REAL NOT NULL CHECK(DlugoscSzlaku > 0)
); 