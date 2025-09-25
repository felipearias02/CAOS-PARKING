from backend.db.connection import get_connection

def buscar_parqueaderos_por_apartamento(numero_apartamento):
    conexion = get_connection()
    try:
        with conexion.cursor() as cursor:
            consulta = """
                SELECT 
                    t.nombre AS torre,
                    a.numero AS apartamento,
                    p.numero AS parqueadero,
                    p.tipo
                FROM asignaciones asg
                JOIN apartamentos a ON asg.apartamento_id = a.id
                JOIN torres t ON a.torre_id = t.id
                JOIN parqueaderos p ON asg.parqueadero_id = p.id
                WHERE a.numero = %s
            """
            cursor.execute(consulta, (numero_apartamento,))
            resultados = cursor.fetchall()
            return resultados
    finally:
        conexion.close()