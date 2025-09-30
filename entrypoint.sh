#!/bin/sh
set -e
# wait for DB host to be ready (simple wait-for)
if [ -n "$DATABASE_URL" ]; then
# optional: parse host and port from DATABASE_URL or rely on netcat if available
echo "DATABASE_URL present"
fi


# run migrations
python manage.py migrate --noinput || true
# collect static if you use it
python manage.py collectstatic --noinput || true


# create superuser if needed (optional, commented)
# echo "from django.contrib.auth import get_user_model; User = get_user_model();
# if not User.objects.filter(username='admin').exists(): User.objects.create_superuser('admin','admin@example.com','admin')" | python manage.py shell


exec "$@"