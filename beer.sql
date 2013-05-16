
CREATE TABLE beers ( 
    id         INTEGER         PRIMARY KEY AUTOINCREMENT
                               NOT NULL,
    key        VARCHAR( 255 )  NOT NULL,
    title      VARCHAR( 255 )  NOT NULL,
    synonyms   VARCHAR( 255 ),
    web        VARCHAR( 255 ),
    since      INTEGER,
    seasonal   BOOLEAN         DEFAULT 'f'
                               NOT NULL,
    limited    BOOLEAN         DEFAULT 'f'
                               NOT NULL,
    kcal       DECIMAL,
    abv        DECIMAL,
    og         DECIMAL,
    srm        INTEGER,
    ibu        INTEGER,
    brewery_id INTEGER,
    brand_id   INTEGER,
    grade      INTEGER         DEFAULT 4
                               NOT NULL,
    txt        VARCHAR( 255 ),
    txt_auto   BOOLEAN         DEFAULT 'f'
                               NOT NULL,
    country_id INTEGER         NOT NULL,
    region_id  INTEGER,
    city_id    INTEGER,
    created_at DATETIME        NOT NULL,
    updated_at DATETIME        NOT NULL 
);


CREATE TABLE brands ( 
    id         INTEGER         PRIMARY KEY AUTOINCREMENT
                               NOT NULL,
    key        VARCHAR( 255 )  NOT NULL,
    title      VARCHAR( 255 )  NOT NULL,
    synonyms   VARCHAR( 255 ),
    web        VARCHAR( 255 ),
    wiki       VARCHAR( 255 ),
    since      INTEGER,
    global     BOOLEAN         DEFAULT 'f'
                               NOT NULL,
    internl    BOOLEAN         DEFAULT 'f'
                               NOT NULL,
    national   BOOLEAN         DEFAULT 'f'
                               NOT NULL,
    regional   BOOLEAN         DEFAULT 'f'
                               NOT NULL,
    local      BOOLEAN         DEFAULT 'f'
                               NOT NULL,
    grade      INTEGER         DEFAULT 4
                               NOT NULL,
    txt        VARCHAR( 255 ),
    txt_auto   BOOLEAN         DEFAULT 'f'
                               NOT NULL,
    brewery_id INTEGER,
    country_id INTEGER         NOT NULL,
    region_id  INTEGER,
    city_id    INTEGER,
    created_at DATETIME        NOT NULL,
    updated_at DATETIME        NOT NULL 
);


CREATE TABLE breweries ( 
    id          INTEGER         PRIMARY KEY AUTOINCREMENT
                                NOT NULL,
    key         VARCHAR( 255 )  NOT NULL,
    title       VARCHAR( 255 )  NOT NULL,
    synonyms    VARCHAR( 255 ),
    address     VARCHAR( 255 ),
    since       INTEGER,
    closed      INTEGER,
    prod        INTEGER,
    prod_grade  INTEGER,
    grade       INTEGER         DEFAULT 4
                                NOT NULL,
    txt         VARCHAR( 255 ),
    txt_auto    BOOLEAN         DEFAULT 'f'
                                NOT NULL,
    web         VARCHAR( 255 ),
    wikipedia   VARCHAR( 255 ),
    indie       BOOLEAN,
    abinbev     BOOLEAN,
    sabmiller   BOOLEAN,
    heineken    BOOLEAN,
    carlsberg   BOOLEAN,
    molsoncoors BOOLEAN,
    diageo      BOOLEAN,
    country_id  INTEGER         NOT NULL,
    region_id   INTEGER,
    city_id     INTEGER,
    created_at  DATETIME        NOT NULL,
    updated_at  DATETIME        NOT NULL 
);
