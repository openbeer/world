title:  beer.db - Using Open Beer & Brewery Data in Ruby

%css

pre {
  padding: 4px 4px 4px 4px;
  border-top: #bbb 1px solid;
  border-bottom: #bbb 1px solid;
  background: #f3f3f3;
}

%end

# `beer.db` - Using Open Beer & Brewery Data in Ruby

### Agenda

- What's `beer.db `?
- Example: Breweries - `breweries.txt`
- Example: Beers  - `beers.txt`
- How to use `beer.db` in Ruby
- What's `world.db `?
- How to use `beer.db` & `world.db` in Ruby
- How to use HTTP JSON API - `GET /beer/guinness`
- Design - Plain Text Format Options
- Design - Better Comma Separated Values (CSV) Format
- "Magic" - Use folder and file names for values and structure
- "Magic" - Use text patterns (regex) for fields




# What's `beer.db `?

A free open public domain beer database & schema
for use in any (programming) language


(e.g. uses plain text fixtures/data sets)

```
### Brewery

guinness, St. James's Gate Brewery / Guinness Brewery, 1759, D, city:dublin
```

```
### Beer

Guinness|Guinness Draught, 4.2%, by:guinness, irish_dry_stout|dry_stout|stout
```


# Example: Breweries - `breweries.txt`

```
##############################
# Wien

ottakringer, Ottakringer Brauerei, 1838, W, city:wien, »
    « 1160 Wien // Ottakringer Straße 91


###########################
# Niederösterreich

zwettler, Zwettler Brauerei, 1709, NÖ, city:zwettl, »
    « 3910 Zwettl // Syrnauer Straße 22-25

weitra,   Weitra Bräu Bierwerkstatt, 1321, NÖ, city:weitra, »
    « 3970 Weitra // Sparkasseplatz 160, zwettler
```

Source: [`europe/at/breweries.txt`](https://github.com/geraldb/beer.db/blob/master/europe/at/breweries.txt)



# Example: Beers  - `beers.txt`

```
Ottakringer Helles,                  5.2 %, 11.8°, by:ottakringer
Ottakringer Gold Fassl Spezial,      5.6 %, 12.7°, by:ottakringer
Ottakringer (Gold Fassl) Pur,        5.2 %, 11.8°, by:ottakringer, bio
Ottakringer (Gold Fassl) Pils,       4.6 %, 11.2°, by:ottakringer
Ottakringer (Gold Fassl) Zwickl,     5.2 %, 12.2°, by:ottakringer

Zwettler Original,     5.1 %,  11.9°, by:zwettler
Zwettler Pils,         4.9 %,  11.5°, by:zwettler
Zwettler Zwickl,       5.5 %,  12.5°, by:zwettler
Zwettler Dunkles,      3.4 %,  11.5°, by:zwettler

Weitra Helles,  5.0 %,   11.8°,  by:weitra
Hadmar,         5.2 %,   12.5°,  by:weitra, bio
```

Source: [`europe/at/beers.txt`](https://github.com/geraldb/beer.db/blob/master/europe/at/beers.txt)



# How to use `beer.db` in Ruby

Brewery Model

```
by = Brewery.find_by_key( 'guinness' )

by.title
=> 'St. James's Gate Brewery / Guinness Brewery'

by.country.key
=> 'ie'

by.country.title
=> 'Irland'

by.city.title
=> 'Dublin'

by.beers.first
=> 'Guinness', 4.2

...
```

# How to use `beer.db` in Ruby (Cont.)

Beer Model

```
b = Beer.find_by_key( 'guinness' )

b.title
=> 'Guinness'

b.abv
=> 4.2

b.tags
=> 'irish_dry_stout', 'dry_stout', 'stout'

b.brewery.title
=> 'St. James's Gate Brewery / Guinness Brewery'

...
```


# What's `world.db `?

A free open public domain world database & schema
for use in any (programming) language

(e.g. uses plain text fixtures/data sets)


```
###  Countries

at, Austria, AUT, 83_871, 8_414_638, un|fifa|uefa|eu|euro|schengen|central_europe|western_europe
```

```
###  Regions (States/Länder/Provinces)

w, Wien [Vienna], 415 km², eastern austria
```

```
### Cities

Wien [Vienna],  W,  1_731_236, m:1_724_000
```


# How to use `beer.db` & `world.db` in Ruby

Country Model

```
at = Country.find_by_key( 'at' )

at.title
=> 'Austria'

at.regions.count
=> 9

at.beers
=> 'Weitra Helles', 'Hadmar', 'Zwettler Original', ...

at.breweries
=> 'Weitra Bräu Bierwerkstatt', 'Zwettler Brauerei', ...

...
```


# How to use `beer.db` & `world.db` in Ruby (Cont.)

City Model

```
wien = City.find_by_key( 'wien' )

wien.title
=> 'Wien'

wien.beers
=> 'Ottakringer Helles', 'Ottakringer (Gold Fassl) Zwickl', ...

wien.breweries
=> 'Ottakringer Brauerei'

...
```


# How to use HTTP JSON API - `GET /beer/guinness`

Get beer by key `/beer/:key`

```
GET /beer/guinness

{
  "beer":
  {
    "key":"guinness",
    "title":"Guinness",
    "synonyms": "Guinness Draught",
    "abv":"4.2",
    "srm":null,
    "og":null,
    "tags":["irish_dry_stout","dry_stout","stout"],
    "brewery":
    {
      "key": "guinness",
      "title": "St. James's Gate Brewery / Guinness Brewery",
      "href": "/brewery/guinness",
    },
    "country":
    {
      "key":"ie",
      "title":"Irland"
    }
  }
}
```


# How to use HTTP JSON API (Cont.) - `GET /brewery/guinness`

Get brewery by key `/brewery/:key`

```
GET /brewery/guinness

{
  "brewery":
  {
    "key": "guinness",
    "title": "St. James's Gate Brewery / Guinness Brewery",
    "synonyms": null,
    "since": 1759,
    "address": "St. James's Gate // Dublin",
    "tags": ["diageo"],
    "beers":
    [
      {
        "key": "guinness",
        "title": "Guinness",
        "href": "/beer/guinness"
      }
    ],
    "country":
    {
      "key": "ie",
      "title": "Irland"
    }
  }
}
```


# Design - Plain Text Format Options

- CSV (Comma Separated Values)
- TSV (Tab Separated Values)
- JSON (JavaScript Object Notation)
- XML (eXtensible Markup Language)
- YML (Yet Another Markup Language)
- SQL (Structured Query Language)


# Design - Better Comma Separated Values (CSV) Format

What's great with CSV?

- Simple plain text
- One line, one record

What's wrong with CSV?

- No comments
- Escaping rules for quotes and commas ugly and not really simple
- No optional fields
- Fixed order of fields
- No "magic" e.g.
    - No auto key generation from title field if leading key field missing (e.g. Guinness => `guinness`)
    - No autofill field values from folder names or file names
        - e.g. `europe/at` sets continent to `europe` and country to `at`
        - e.g. `beers.2.txt` sets type/class to `beer` and grade to `2`


# "Magic" - Use folder and file names for values and structure

Do __NOT__ put everything into a single file e.g. `beers.csv`. Better use folders
 and use folder and file names for adding some "magic" e.g. to autofill values
 e.g. set values for continent, country, city, district, etc. Example:

`beer.db`:

```
europe/
      at/
         beers.txt
         beers.2.txt
         breweries.txt
         breweries.2.txt
         ...
north-america/
              mx/
                beers.txt
                breweries.txt
                ...
pacific/
       au/
       ...
...
```

or

`wien.db`:

```
1-innere-stadt/
               brewpubs.txt
               cafes.txt
               cinemas.txt
2-leopoldstadt/
              ...
3-landstraße/
            ...

```


# "Magic" - Use text patterns (regex) for fields

### Year Brewery Established

e.g. 1759 or 1321

Always four digits => `/[0-9]{4}/`


### Region (e.g. State/Bundesland/etc.)

e.g. TX => Texas, or  N => Niederösterreich

Always one or two uppercase letters  => `/[A-Z]{1,2}/`


### Alcohol by Volume (ABV)

e.g. 5.4% => 5.4

Numbers ending with precent (%) => `/[0-9]+%/`

and many more text patterns in use.



# That's it. Thank You.

### Links 

- [github.com/geraldb/beer.db](https://github.com/geraldb/beer.db)
- [github.com/geraldb/football.db](https://github.com/geraldb/football.db)
- [github.com/geraldb/world.db](https://github.com/geraldb/world.db)

### Questions? Comments?



# Bonus: Using CSV, JSON, YML 'n' Friends

Use the HTTP API service and export your data in your format of choice.

