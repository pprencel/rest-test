# Dokumntacja string API

Endpoint:

*GET chars_recognize/*

parament wymagany
*str*


_Przyklad_ opowiedz z API dla zapytania GET _/chars_recognize?str=MM1!@a4_
```
{
    "charsTypes": {
        "lowerCase": [
            "a"
        ],
        "upperCase": [
            "M",
            "M"
        ],
        "digits": [
            "1",
            "4"
        ],
        "special": [
            "!",
            "@"
        ]
    },
    "errors": []
}
```

_Przyklad_ opowiedz z API dla zapytania GET _/chars_recognize_ gdy nie podamy wymaganego paramentu *str*
```
{
    "charsTypes": "",
    "errors": [
        "No parameters given"
    ]
}
```
