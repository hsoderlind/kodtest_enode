# Henrics kodtest

## Filmbutiken

Butiken vill ha ett system i vilket de kan följa sin filminventering, kunder och försäljning.

## Kategorier och priser

Butiken innehåller tre filmkategorier, var och en med individuell prissättning:

-   "Nya utgåvor" som kostar 200 kr.
-   "Vanliga filmer" som kostar 100 kr.
-   "Gamla filmer" som kostar 50 kr.

## Poängprogram

Butiken ger registrerade kunder bonus vid varje köp. Varje film som köps är värd ett visst
antal poäng beroende på vilken kategori den tillhör:

-   "Nya utgåvor" ger 20 poäng.
-   "Vanliga filmer" ger 10 poäng.
-   "Gamla filmer" ger 5 poäng.

Vid köp över 150 kr kan registrerade kunder använda sina poäng för att få rabatt på
köp, där varje använd poäng omvandlas till 1 kr.

## Specifikation

-   Systemet ska stödja de kategorier och priser som nämns.
-   Systemet ska stödja poängprogrammet.
-   Det ska vara möjligt att lägga till / ta bort filmer och ändra kategori.
-   Det ska vara möjligt att lägga till / ta bort kunder.
-   Det ska vara möjligt att skapa en faktura som innehåller de köpta filmerna och kunden (om registrerad).
-   Det ska vara möjligt att lägga till / ta bort poäng från kunder.

## Requirements:

-   **Ruby version:** 3.4.1

-   **Rails version:** 8.0.1

-   **System dependencies** ruby and rubyy on rails

-   Configuration

-   Database creation
-   -   Run `rails db:create`

-   Database initialization
-   -   Run `rails db:migrate`
-   -   Run `rails db:seed`

-   **How to run the test suite:**\
    Run `rails test`\
    **Postman:** There is a collection of Postman requests that can be used to test request to some of the API endpoints. You'll find the collection in Enode_kodtest.postman_collection.json\

-   Services (job queues, cache servers, search engines, etc.)

-   Deployment instructions
-   -   Clone this repo: `git clone https://github.com/hsoderlind/kodtest_enode`
-   -   Run `bundle install`
-   -   Run `rails db:create`
-   -   Run `rails db:migrate`
-   -   Run `rails db:seed`
-   -   Rub `rails server`

-   ...

## Todo

-   [x] Skapa en README.md
-   [x] Skapa ett repository på GitHub
-   [x] Skapa en databas
-   [x] Skapa en resurs för filmer
-   [x] Skapa routes för filmer
-   [x] Skapa en resurs för kategorier
-   [x] Skapa routes för kategorier
-   [x] Skapa en resurs för kampanjer
-   [x] Skapa routes för kampanjer
-   [x] Skapa en resurs för kunder
-   [x] Skapa routes för kunder
-   [x] Skapa en resurs för kundvagn
-   [x] Skapa routes för kundvagn
-   [x] Skapa klass för gäst kund
-   [x] Skapa logik för nuvarande kund (current_customer)
-   [x] Skapa en resurs för poäng
-   [x] Skapa routes för poäng
-   [x] Skapa en resurs för försäljningar
-   [x] Skapa routes för försäljningar
-   [x] Skapa en resurs för fakturor
-   [x] Skapa routes för fakturor
-   [x] Clean up

## Reflektioner

Första gången med Ruby och Ruby on Rails. Måste medge att Rby är ett intressant språk. Det skiljer sig mycket från de andra programmeringsspråk jag har erfarenhet av. Det är lätt att komma igång och sparar tid att utveckla i.\
Jag har erfarenhet av att jobba i Laravel (PHP-ramverk) och Ruby on rails och Laravel påminner mycket om varandra så jag kände igen mig många gånger i begreppen och logiken.
Det finns säkert mängder med förbättringar man kan göra i min kodbas både vad det gäller placering av logik och säkerhet.
Jag tycker jag har fått en god förståelse för hur man använder Ruby on rails och det är en bra grund att utveckla vidare på.
