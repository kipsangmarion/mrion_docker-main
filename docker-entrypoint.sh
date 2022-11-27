#!/bin/bash
echo "Apply database migrations"
echo "Starting server"
pyhton -v
echo "Django docker is fully configured successfully."


#python3 manage.py runserver 0.0.0.0:8000

exec "$@"