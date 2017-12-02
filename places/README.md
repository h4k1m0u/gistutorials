# Install & configure PostGIS
- **Install PostGIS:** `pacman -S postgis`
- **Change to postgres user:** `sudo -u postgres -i`
- **Run CLI client:** `psql`
- **Install PostGIS extension:** `CREATE EXTENSION postgis;`

# Import GeoJSON into a PostGIS table
- **Migrate model to create table:** `python manage.py migrate`
- **Append shapefile content to table:** `ogr2ogr -f "PostgreSQL" PG:"dbname=<dbname> user=<db-user>" <shapefile> -nln <tablename> -append`
