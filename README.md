# Magic: The Gathering Elixir SDK

Elixir SDK for using the [magicthegathering.io](http://magicthegathering.io) APIs.

Note that API use is free and does not require authentication or registration, but some rate limits apply. [Read the official API website for more information](https://docs.magicthegathering.io/#documentationrate_limits).

Add the dependency to your project and you're good to go!

## Installation

This package can be installed by adding `mtg_sdk_elixir` to your list of dependencies in
`mix.exs`:

```elixir
def deps do
  [{:mtg_sdk_elixir, "~> 1.0.0"}]
end
```

Now you are ready to start calling MTG API.

## Usage examples

### Cards

#### Get all cards with default values (pageSize = 100, page = 0)
```elixir
iex> Mtg.list(Mtg.Card)
{:ok,
 %Mtg.Response.Collection{
   count: 100,
   data: [
     %Mtg.Card{
       ...
       rarity: "Rare",
       ...
       set_name: "Tenth Edition",
       name: "Abundance",
       ...
       foreign_names: [
         %Mtg.Card.ForeignName{
           flavor: nil,
           image_url: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=148402&type=card",
           language: "German",
           multiverseid: 148402,
           name: "Überfluss",
           text: "Falls du eine Karte ziehen würdest, kannst du stattdessen Land oder Nichtland bestimmen und Karten oben von deiner Bibliothek aufdecken, bis du eine Karte der bestimmten Art aufdeckst. Nimm diese Karte auf deine Hand und lege alle anderen auf diese Weise aufgedeckten Karten in beliebiger Reihenfolge unter deine Bibliothek."
         },
         ...
       },
       ...
       rulings: [
         %Mtg.Card.Ruling{
           date: "2004-10-04",
           text: "This replacement effect replaces the draw, so nothing that triggers on a draw will trigger."
         },
         ...
       ],
       id: "1669af17-d287-5094-b005-4b143441442f",
       legalities: [
         %Mtg.Card.Legality{format: "Commander", legality: "Legal"},
         ...
       ],
       watermark: nil
     },
     ...
   ],
   page_size: 100,
   total_count: 45846,
   type: "Card"
 }}
```

#### Get all cards with filters (name = "Abundance")
```elixir
iex> Mtg.list(Mtg.Card)
{:ok,
 %Mtg.Response.Collection{
   count: 6,
   data: [
     %Mtg.Card{...},
     ...
   ],
   page_size: 100,
   total_count: 6,
   type: "Card"
 }}
```

#### Get all cards with OR filters (name = "Abundance" OR name = "Tarmogoyf")
```elixir
iex> Mtg.list(Mtg.Card, [{:name, :or, ["Abundance", "Tarmogoyf"]}])
{:ok,
 %Mtg.Response.Collection{
   count: 12,
   data: [
     %Mtg.Card{...},
     ...
   ],
   page_size: 100,
   total_count: 12,
   type: "Card"
 }}
```

#### Get all cards with AND filters (name = "Abu" AND name = "dance")
```elixir
iex> Mtg.list(Mtg.Card, [{:name, :and, ["Abu", "dance"]}])
{:ok,
 %Mtg.Response.Collection{
   count: 6,
   data: [
     %Mtg.Card{...},
     ...
   ],
   page_size: 100,
   total_count: 6,
   type: "Card"
 }}
```

For more query filters, visit [https://docs.magicthegathering.io/#api_v1cards_list](https://docs.magicthegathering.io/#api_v1cards_list).