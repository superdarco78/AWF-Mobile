# -*- coding: utf-8 -*-
"""Dane o pliku wpisywane w .exe przy budowaniu.

Bez tych danych Windows widzi plik bez nazwy, wydawcy i wersji —
a takie Inteligentna kontrola aplikacji blokuje najchetniej.
Numer podstawia budowanie, czytajac go z wersja-programu.txt.
"""

WERSJA = (13, 0, 0, 0)

VSVersionInfo(
    ffi=FixedFileInfo(
        filevers=WERSJA,
        prodvers=WERSJA,
        mask=0x3f,
        flags=0x0,
        OS=0x40004,
        fileType=0x1,
        subtype=0x0,
        date=(0, 0),
    ),
    kids=[
        StringFileInfo([
            StringTable("041504b0", [
                StringStruct("CompanyName", "Monter24h.pl"),
                StringStruct("FileDescription",
                             "AWF KIEROWCY - kontrola wjazdu i wyjazdu"),
                StringStruct("FileVersion", ".".join(map(str, WERSJA))),
                StringStruct("InternalName", "AWF-Kierowcy"),
                StringStruct("LegalCopyright",
                             "Monter24h.pl dla Strazy Akademickiej AWF"),
                StringStruct("OriginalFilename", "AWF-Kierowcy.exe"),
                StringStruct("ProductName", "AWF KIEROWCY"),
                StringStruct("ProductVersion", ".".join(map(str, WERSJA))),
            ]),
        ]),
        VarFileInfo([VarStruct("Translation", [0x0415, 1200])]),
    ],
)
