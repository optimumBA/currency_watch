# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CurrencyWatch.Repo.insert!(%CurrencyWatch.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias CurrencyWatch.Repo
alias CurrencyWatch.Currency

Repo.insert! %Currency{
  code: "AED",
  name: "United Arab Emirates Dirham",
  flag: "ae"
}
Repo.insert! %Currency{
  code: "AFN",
  name: "Afghan Afghani",
  flag: "af"
}
Repo.insert! %Currency{
  code: "ALL",
  name: "Albanian Lek",
  flag: "al"
}
Repo.insert! %Currency{
  code: "AMD",
  name: "Armenian Dram",
  flag: "am"
}
Repo.insert! %Currency{
  code: "ANG",
  name: "Netherlands Antillean Guilder",
  flag: "nl"
}
Repo.insert! %Currency{
  code: "AOA",
  name: "Angolan Kwanza",
  flag: "ao"
}
Repo.insert! %Currency{
  code: "ARS",
  name: "Argentine Peso",
  flag: "ar"
}
Repo.insert! %Currency{
  code: "AUD",
  name: "Australian Dollar",
  flag: "au"
}
Repo.insert! %Currency{
  code: "AWG",
  name: "Aruban Florin",
  flag: "aw"
}
Repo.insert! %Currency{
  code: "AZN",
  name: "Azerbaijani Manat",
  flag: "az"
}
Repo.insert! %Currency{
  code: "BAM",
  name: "Bosnia-Herzegovina Convertible Mark",
  flag: "ba"
}
Repo.insert! %Currency{
  code: "BBD",
  name: "Barbadian Dollar",
  flag: "bb"
}
Repo.insert! %Currency{
  code: "BDT",
  name: "Bangladeshi Taka",
  flag: "bd"
}
Repo.insert! %Currency{
  code: "BGN",
  name: "Bulgarian Lev",
  flag: "bg"
}
Repo.insert! %Currency{
  code: "BHD",
  name: "Bahraini Dinar",
  flag: "bh"
}
Repo.insert! %Currency{
  code: "BIF",
  name: "Burundian Franc",
  flag: "bi"
}
Repo.insert! %Currency{
  code: "BMD",
  name: "Bermudan Dollar",
  flag: "bm"
}
Repo.insert! %Currency{
  code: "BND",
  name: "Brunei Dollar",
  flag: "bn"
}
Repo.insert! %Currency{
  code: "BOB",
  name: "Bolivian Boliviano",
  flag: "bo"
}
Repo.insert! %Currency{
  code: "BRL",
  name: "Brazilian Real",
  flag: "br"
}
Repo.insert! %Currency{
  code: "BSD",
  name: "Bahamian Dollar",
  flag: "bs"
}
Repo.insert! %Currency{
  code: "BTC",
  name: "Bitcoin",
  flag: nil
}
Repo.insert! %Currency{
  code: "BTN",
  name: "Bhutanese Ngultrum",
  flag: "bt"
}
Repo.insert! %Currency{
  code: "BWP",
  name: "Botswanan Pula",
  flag: "bw"
}
Repo.insert! %Currency{
  code: "BYN",
  name: "New Belarusian Ruble",
  flag: "by"
}
Repo.insert! %Currency{
  code: "BYR",
  name: "Belarusian Ruble",
  flag: "by"
}
Repo.insert! %Currency{
  code: "BZD",
  name: "Belize Dollar",
  flag: "bz"
}
Repo.insert! %Currency{
  code: "CAD",
  name: "Canadian Dollar",
  flag: "ca"
}
Repo.insert! %Currency{
  code: "CDF",
  name: "Congolese Franc",
  flag: "cd"
}
Repo.insert! %Currency{
  code: "CHF",
  name: "Swiss Franc",
  flag: "ch"
}
Repo.insert! %Currency{
  code: "CLF",
  name: "Chilean Unit of Account (UF)",
  flag: "cl"
}
Repo.insert! %Currency{
  code: "CLP",
  name: "Chilean Peso",
  flag: "cl"
}
Repo.insert! %Currency{
  code: "CNY",
  name: "Chinese Yuan",
  flag: "cn"
}
Repo.insert! %Currency{
  code: "COP",
  name: "Colombian Peso",
  flag: "co"
}
Repo.insert! %Currency{
  code: "CRC",
  name: "Costa Rican Colón",
  flag: "cr"
}
Repo.insert! %Currency{
  code: "CUC",
  name: "Cuban Convertible Peso",
  flag: "cu"
}
Repo.insert! %Currency{
  code: "CUP",
  name: "Cuban Peso",
  flag: "cu"
}
Repo.insert! %Currency{
  code: "CVE",
  name: "Cape Verdean Escudo",
  flag: "cv"
}
Repo.insert! %Currency{
  code: "CZK",
  name: "Czech Republic Koruna",
  flag: "cz"
}
Repo.insert! %Currency{
  code: "DJF",
  name: "Djiboutian Franc",
  flag: "dj"
}
Repo.insert! %Currency{
  code: "DKK",
  name: "Danish Krone",
  flag: "dk"
}
Repo.insert! %Currency{
  code: "DOP",
  name: "Dominican Peso",
  flag: "do"
}
Repo.insert! %Currency{
  code: "DZD",
  name: "Algerian Dinar",
  flag: "dz"
}
Repo.insert! %Currency{
  code: "EEK",
  name: "Estonian Kroon",
  flag: "ee"
}
Repo.insert! %Currency{
  code: "EGP",
  name: "Egyptian Pound",
  flag: "eg"
}
Repo.insert! %Currency{
  code: "ERN",
  name: "Eritrean Nakfa",
  flag: "er"
}
Repo.insert! %Currency{
  code: "ETB",
  name: "Ethiopian Birr",
  flag: "et"
}
Repo.insert! %Currency{
  code: "EUR",
  name: "Euro",
  flag: "eu"
}
Repo.insert! %Currency{
  code: "FJD",
  name: "Fijian Dollar",
  flag: "fj"
}
Repo.insert! %Currency{
  code: "FKP",
  name: "Falkland Islands Pound",
  flag: "fk"
}
Repo.insert! %Currency{
  code: "GBP",
  name: "British Pound Sterling",
  flag: "gb"
}
Repo.insert! %Currency{
  code: "GEL",
  name: "Georgian Lari",
  flag: "ge"
}
Repo.insert! %Currency{
  code: "GGP",
  name: "Guernsey Pound",
  flag: "gg"
}
Repo.insert! %Currency{
  code: "GHS",
  name: "Ghanaian Cedi",
  flag: "gh"
}
Repo.insert! %Currency{
  code: "GIP",
  name: "Gibraltar Pound",
  flag: "gi"
}
Repo.insert! %Currency{
  code: "GMD",
  name: "Gambian Dalasi",
  flag: "gm"
}
Repo.insert! %Currency{
  code: "GNF",
  name: "Guinean Franc",
  flag: "gn"
}
Repo.insert! %Currency{
  code: "GTQ",
  name: "Guatemalan Quetzal",
  flag: "gt"
}
Repo.insert! %Currency{
  code: "GYD",
  name: "Guyanaese Dollar",
  flag: "gy"
}
Repo.insert! %Currency{
  code: "HKD",
  name: "Hong Kong Dollar",
  flag: "hk"
}
Repo.insert! %Currency{
  code: "HNL",
  name: "Honduran Lempira",
  flag: "hn"
}
Repo.insert! %Currency{
  code: "HRK",
  name: "Croatian Kuna",
  flag: "hr"
}
Repo.insert! %Currency{
  code: "HTG",
  name: "Haitian Gourde",
  flag: "ht"
}
Repo.insert! %Currency{
  code: "HUF",
  name: "Hungarian Forint",
  flag: "hu"
}
Repo.insert! %Currency{
  code: "IDR",
  name: "Indonesian Rupiah",
  flag: "id"
}
Repo.insert! %Currency{
  code: "ILS",
  name: "Israeli New Sheqel",
  flag: "il"
}
Repo.insert! %Currency{
  code: "IMP",
  name: "Manx pound",
  flag: "im"
}
Repo.insert! %Currency{
  code: "INR",
  name: "Indian Rupee",
  flag: "in"
}
Repo.insert! %Currency{
  code: "IQD",
  name: "Iraqi Dinar",
  flag: "iq"
}
Repo.insert! %Currency{
  code: "IRR",
  name: "Iranian Rial",
  flag: "ir"
}
Repo.insert! %Currency{
  code: "ISK",
  name: "Icelandic Króna",
  flag: "is"
}
Repo.insert! %Currency{
  code: "JEP",
  name: "Jersey Pound",
  flag: "je"
}
Repo.insert! %Currency{
  code: "JMD",
  name: "Jamaican Dollar",
  flag: "jm"
}
Repo.insert! %Currency{
  code: "JOD",
  name: "Jordanian Dinar",
  flag: "jo"
}
Repo.insert! %Currency{
  code: "JPY",
  name: "Japanese Yen",
  flag: "jp"
}
Repo.insert! %Currency{
  code: "KES",
  name: "Kenyan Shilling",
  flag: "ke"
}
Repo.insert! %Currency{
  code: "KGS",
  name: "Kyrgystani Som",
  flag: "kg"
}
Repo.insert! %Currency{
  code: "KHR",
  name: "Cambodian Riel",
  flag: "kh"
}
Repo.insert! %Currency{
  code: "KMF",
  name: "Comorian Franc",
  flag: "km"
}
Repo.insert! %Currency{
  code: "KPW",
  name: "North Korean Won",
  flag: "kp"
}
Repo.insert! %Currency{
  code: "KRW",
  name: "South Korean Won",
  flag: "kr"
}
Repo.insert! %Currency{
  code: "KWD",
  name: "Kuwaiti Dinar",
  flag: "kw"
}
Repo.insert! %Currency{
  code: "KYD",
  name: "Cayman Islands Dollar",
  flag: "ky"
}
Repo.insert! %Currency{
  code: "KZT",
  name: "Kazakhstani Tenge",
  flag: "kz"
}
Repo.insert! %Currency{
  code: "LAK",
  name: "Laotian Kip",
  flag: "la"
}
Repo.insert! %Currency{
  code: "LBP",
  name: "Lebanese Pound",
  flag: "lb"
}
Repo.insert! %Currency{
  code: "LKR",
  name: "Sri Lankan Rupee",
  flag: "lk"
}
Repo.insert! %Currency{
  code: "LRD",
  name: "Liberian Dollar",
  flag: "lr"
}
Repo.insert! %Currency{
  code: "LSL",
  name: "Lesotho Loti",
  flag: "ls"
}
Repo.insert! %Currency{
  code: "LTL",
  name: "Lithuanian Litas",
  flag: "lt"
}
Repo.insert! %Currency{
  code: "LVL",
  name: "Latvian Lats",
  flag: "lv"
}
Repo.insert! %Currency{
  code: "LYD",
  name: "Libyan Dinar",
  flag: "ly"
}
Repo.insert! %Currency{
  code: "MAD",
  name: "Moroccan Dirham",
  flag: "ma"
}
Repo.insert! %Currency{
  code: "MDL",
  name: "Moldovan Leu",
  flag: "md"
}
Repo.insert! %Currency{
  code: "MGA",
  name: "Malagasy Ariary",
  flag: "mg"
}
Repo.insert! %Currency{
  code: "MKD",
  name: "Macedonian Denar",
  flag: "mk"
}
Repo.insert! %Currency{
  code: "MMK",
  name: "Myanma Kyat",
  flag: "mm"
}
Repo.insert! %Currency{
  code: "MNT",
  name: "Mongolian Tugrik",
  flag: "mn"
}
Repo.insert! %Currency{
  code: "MOP",
  name: "Macanese Pataca",
  flag: "mo"
}
Repo.insert! %Currency{
  code: "MRO",
  name: "Mauritanian Ouguiya",
  flag: "mr"
}
Repo.insert! %Currency{
  code: "MUR",
  name: "Mauritian Rupee",
  flag: "mu"
}
Repo.insert! %Currency{
  code: "MVR",
  name: "Maldivian Rufiyaa",
  flag: "mv"
}
Repo.insert! %Currency{
  code: "MWK",
  name: "Malawian Kwacha",
  flag: "mw"
}
Repo.insert! %Currency{
  code: "MXN",
  name: "Mexican Peso",
  flag: "mx"
}
Repo.insert! %Currency{
  code: "MYR",
  name: "Malaysian Ringgit",
  flag: "my"
}
Repo.insert! %Currency{
  code: "MZN",
  name: "Mozambican Metical",
  flag: "mz"
}
Repo.insert! %Currency{
  code: "NAD",
  name: "Namibian Dollar",
  flag: "na"
}
Repo.insert! %Currency{
  code: "NGN",
  name: "Nigerian Naira",
  flag: "ng"
}
Repo.insert! %Currency{
  code: "NIO",
  name: "Nicaraguan Córdoba",
  flag: "ni"
}
Repo.insert! %Currency{
  code: "NOK",
  name: "Norwegian Krone",
  flag: "no"
}
Repo.insert! %Currency{
  code: "NPR",
  name: "Nepalese Rupee",
  flag: "np"
}
Repo.insert! %Currency{
  code: "NZD",
  name: "New Zealand Dollar",
  flag: "nz"
}
Repo.insert! %Currency{
  code: "OMR",
  name: "Omani Rial",
  flag: "om"
}
Repo.insert! %Currency{
  code: "PAB",
  name: "Panamanian Balboa",
  flag: "pa"
}
Repo.insert! %Currency{
  code: "PEN",
  name: "Peruvian Nuevo Sol",
  flag: "pe"
}
Repo.insert! %Currency{
  code: "PGK",
  name: "Papua New Guinean Kina",
  flag: "pg"
}
Repo.insert! %Currency{
  code: "PHP",
  name: "Philippine Peso",
  flag: "ph"
}
Repo.insert! %Currency{
  code: "PKR",
  name: "Pakistani Rupee",
  flag: "pk"
}
Repo.insert! %Currency{
  code: "PLN",
  name: "Polish Zloty",
  flag: "pl"
}
Repo.insert! %Currency{
  code: "PYG",
  name: "Paraguayan Guarani",
  flag: "py"
}
Repo.insert! %Currency{
  code: "QAR",
  name: "Qatari Rial",
  flag: "qa"
}
Repo.insert! %Currency{
  code: "RON",
  name: "Romanian Leu",
  flag: "ro"
}
Repo.insert! %Currency{
  code: "RSD",
  name: "Serbian Dinar",
  flag: "rs"
}
Repo.insert! %Currency{
  code: "RUB",
  name: "Russian Ruble",
  flag: "ru"
}
Repo.insert! %Currency{
  code: "RWF",
  name: "Rwandan Franc",
  flag: "rw"
}
Repo.insert! %Currency{
  code: "SAR",
  name: "Saudi Riyal",
  flag: "sa"
}
Repo.insert! %Currency{
  code: "SBD",
  name: "Solomon Islands Dollar",
  flag: "sb"
}
Repo.insert! %Currency{
  code: "SCR",
  name: "Seychellois Rupee",
  flag: "sc"
}
Repo.insert! %Currency{
  code: "SDG",
  name: "Sudanese Pound",
  flag: "sd"
}
Repo.insert! %Currency{
  code: "SEK",
  name: "Swedish Krona",
  flag: "sw"
}
Repo.insert! %Currency{
  code: "SGD",
  name: "Singapore Dollar",
  flag: "sg"
}
Repo.insert! %Currency{
  code: "SHP",
  name: "Saint Helena Pound",
  flag: "sh"
}
Repo.insert! %Currency{
  code: "SLL",
  name: "Sierra Leonean Leone",
  flag: "sl"
}
Repo.insert! %Currency{
  code: "SOS",
  name: "Somali Shilling",
  flag: "so"
}
Repo.insert! %Currency{
  code: "SRD",
  name: "Surinamese Dollar",
  flag: "sr"
}
Repo.insert! %Currency{
  code: "STD",
  name: "São Tomé and Príncipe Dobra",
  flag: "st"
}
Repo.insert! %Currency{
  code: "SVC",
  name: "Salvadoran Colón",
  flag: "sv"
}
Repo.insert! %Currency{
  code: "SYP",
  name: "Syrian Pound",
  flag: "sy"
}
Repo.insert! %Currency{
  code: "SZL",
  name: "Swazi Lilangeni",
  flag: "sz"
}
Repo.insert! %Currency{
  code: "THB",
  name: "Thai Baht",
  flag: "th"
}
Repo.insert! %Currency{
  code: "TJS",
  name: "Tajikistani Somoni",
  flag: "tj"
}
Repo.insert! %Currency{
  code: "TMT",
  name: "Turkmenistani Manat",
  flag: "tm"
}
Repo.insert! %Currency{
  code: "TND",
  name: "Tunisian Dinar",
  flag: "tn"
}
Repo.insert! %Currency{
  code: "TOP",
  name: "Tongan Paʻanga",
  flag: "to"
}
Repo.insert! %Currency{
  code: "TRY",
  name: "Turkish Lira",
  flag: "tr"
}
Repo.insert! %Currency{
  code: "TTD",
  name: "Trinidad and Tobago Dollar",
  flag: "tt"
}
Repo.insert! %Currency{
  code: "TWD",
  name: "New Taiwan Dollar",
  flag: "tw"
}
Repo.insert! %Currency{
  code: "TZS",
  name: "Tanzanian Shilling",
  flag: "tz"
}
Repo.insert! %Currency{
  code: "UAH",
  name: "Ukrainian Hryvnia",
  flag: "ua"
}
Repo.insert! %Currency{
  code: "UGX",
  name: "Ugandan Shilling",
  flag: "ug"
}
Repo.insert! %Currency{
  code: "USD",
  name: "United States Dollar",
  flag: "us"
}
Repo.insert! %Currency{
  code: "UYU",
  name: "Uruguayan Peso",
  flag: "uy"
}
Repo.insert! %Currency{
  code: "UZS",
  name: "Uzbekistan Som",
  flag: "uz"
}
Repo.insert! %Currency{
  code: "VEF",
  name: "Venezuelan Bolívar Fuerte",
  flag: "ve"
}
Repo.insert! %Currency{
  code: "VND",
  name: "Vietnamese Dong",
  flag: "vn"
}
Repo.insert! %Currency{
  code: "VUV",
  name: "Vanuatu Vatu",
  flag: "vu"
}
Repo.insert! %Currency{
  code: "WST",
  name: "Samoan Tala",
  flag: "ws"
}
Repo.insert! %Currency{
  code: "XAF",
  name: "CFA Franc BEAC",
  flag: nil
}
Repo.insert! %Currency{
  code: "XAG",
  name: "Silver (troy ounce)",
  flag: nil
}
Repo.insert! %Currency{
  code: "XAU",
  name: "Gold (troy ounce)",
  flag: nil
}
Repo.insert! %Currency{
  code: "XCD",
  name: "East Caribbean Dollar",
  flag: nil
}
Repo.insert! %Currency{
  code: "XDR",
  name: "Special Drawing Rights",
  flag: nil
}
Repo.insert! %Currency{
  code: "XOF",
  name: "CFA Franc BCEAO",
  flag: nil
}
Repo.insert! %Currency{
  code: "XPF",
  name: "CFP Franc",
  flag: nil
}
Repo.insert! %Currency{
  code: "YER",
  name: "Yemeni Rial",
  flag: "ye"
}
Repo.insert! %Currency{
  code: "ZAR",
  name: "South African Rand",
  flag: "za"
}
Repo.insert! %Currency{
  code: "ZMK",
  name: "Zambian Kwacha (pre-2013)",
  flag: "zm"
}
Repo.insert! %Currency{
  code: "ZMW",
  name: "Zambian Kwacha",
  flag: "zm"
}
Repo.insert! %Currency{
  code: "ZWL",
  name: "Zimbabwean Dollar",
  flag: "zw"
}
