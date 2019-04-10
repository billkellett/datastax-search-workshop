// create the keyspace for the workshop

create keyspace if not exists search_workshop
with replication = {
    'class' : 'NetworkTopologyStrategy',
    'replication_factor' : 3
};

// create the searchable version of the instruments table.  This holds 1 row for every investment instrument.

create table if not exists search_workshop.instrument_rated_searchable (
    instrument_symbol       text,
    instrument_name         text,
    instrument_industry     text,
    supports_fair_trade     int,
    humane_work_conditions  int,
    humane_to_women         int,
    humane_to_children      int,
    humane_to_animals       int,
    avoids_blood_diamonds   int,
    avoids_weapons          int,
    avoids_tobacco          int,
    avoids_gambling         int,
    avoids_alcohol          int,
    protects_environment    int,
    description             text,
    PRIMARY KEY (instrument_symbol)
)
;

// create the UNsearchable version of the instruments table.  This holds 1 row for every investment instrument.

create table if not exists search_workshop.instrument_rated_not_searchable (
    instrument_symbol       text,
    instrument_name         text,
    instrument_industry     text,
    supports_fair_trade     int,
    humane_work_conditions  int,
    humane_to_women         int,
    humane_to_children      int,
    humane_to_animals       int,
    avoids_blood_diamonds   int,
    avoids_weapons          int,
    avoids_tobacco          int,
    avoids_gambling         int,
    avoids_alcohol          int,
    protects_environment    int,
    description             text,
    PRIMARY KEY (instrument_symbol)
)
;

// this is for the geospatial lab - searchable

create table if not exists search_workshop.customer_searchable (
    customer_id                 text,
    customer_name               text,
    csr_id                      int,
    supports_fair_trade_min     int,
    humane_work_conditions_min  int,
    humane_to_women_min         int,
    humane_to_children_min      int,
    humane_to_animals_min       int,
    avoids_blood_diamonds_min   int,
    avoids_weapons_min          int,
    avoids_tobacco_min          int,
    avoids_gambling_min         int,
    avoids_alcohol_min          int,
    protects_environment_min    int,
    customer_city               text,
    coords                      'PointType',
primary key (customer_id));  

// Now the unsearchable version for the geospatial lab

create table if not exists search_workshop.customer_not_searchable (
    customer_id                 text,
    customer_name               text,
    csr_id                      int,
    supports_fair_trade_min     int,
    humane_work_conditions_min  int,
    humane_to_women_min         int,
    humane_to_children_min      int,
    humane_to_animals_min       int,
    avoids_blood_diamonds_min   int,
    avoids_weapons_min          int,
    avoids_tobacco_min          int,
    avoids_gambling_min         int,
    avoids_alcohol_min          int,
    protects_environment_min    int,
    customer_city               text,
    coords                      'PointType',
primary key (customer_id));  
