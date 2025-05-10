from fastapi import FastAPI

app = FastAPI(
    title="Echo Service API",
    description="Prosty serwis echo, który zwraca ostatni segment ścieżki URL.",
    version="1.0.0"
)

@app.get("/")
async def read_root():
    """
    Główny endpoint, zwraca informację o serwisie.
    """
    return {"message": "Witaj w Echo Service! Wypróbuj np. /twoj_tekst"}

@app.get("/{path_segment}")
async def echo_path_segment(path_segment: str):
    """
    Zwraca podany segment ścieżki jako string.
    Na przykład, zapytanie do /hej zwróci "hej".
    Zapytanie do /jakis/dluzszy/tekst zwróci "tekst" (ostatni segment).
    Jeśli chcesz całą ścieżkę, użyj @app.get("/{full_path:path}") poniżej.
    """
    return path_segment

@app.get("/hello_world")
async def echo_helo_world():
    return {"message": "Hello world!"}
