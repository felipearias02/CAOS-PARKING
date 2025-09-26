from backend.db.connection import get_connection

def buscar_parqueaderos_por_apartamento(numero_apartamento):
    conn = get_connection()
    cursor = conn.cursor()

    query = """
        SELECT p.tipo, p.numero
        FROM parqueaderos p
        INNER JOIN asignaciones a ON p.id = a.parqueadero_id
        INNER JOIN apartamentos ap ON a.apartamento_id = ap.id
        WHERE ap.numero = ?
    """

    cursor.execute(query, (numero_apartamento,))
    resultados = cursor.fetchall()
    conn.close()

    parqueaderos = [dict(row) for row in resultados]
    return parqueaderos