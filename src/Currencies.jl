module Currencies

using MacroTools
import Base: +, -, *, /, ==


DATA = Dict(
    :AED => (2, "United Arab Emirates dirham"),
    :AFN => (2, "Afghan afghani"),
    :ALL => (2, "Albanian lek"),
    :AMD => (2, "Armenian dram"),
    :ANG => (2, "Netherlands Antillean guilder"),
    :AOA => (2, "Angolan kwanza"),
    :ARS => (2, "Argentine peso"),
    :AUD => (2, "Australian dollar"),
    :AWG => (2, "Aruban florin"),
    :AZN => (2, "Azerbaijani manat"),
    :BAM => (2, "Bosnia and Herzegovina convertible mark"),
    :BBD => (2, "Barbados dollar"),
    :BDT => (2, "Bangladeshi taka"),
    :BGN => (2, "Bulgarian lev"),
    :BHD => (3, "Bahraini dinar"),
    :BIF => (0, "Burundian franc"),
    :BMD => (2, "Bermudian dollar"),
    :BND => (2, "Brunei dollar"),
    :BOB => (2, "Boliviano"),
    :BOV => (2, "Bolivian Mvdol (funds code)"),
    :BRL => (2, "Brazilian real"),
    :BSD => (2, "Bahamian dollar"),
    :BTN => (2, "Bhutanese ngultrum"),
    :BWP => (2, "Botswana pula"),
    :BYR => (0, "Belarusian ruble"),
    :BZD => (2, "Belize dollar"),
    :CAD => (2, "Canadian dollar"),
    :CDF => (2, "Congolese franc"),
    :CHE => (2, "WIR Euro (complementary currency)"),
    :CHF => (2, "Swiss franc"),
    :CHW => (2, "WIR Franc (complementary currency)"),
    :CLF => (4, "Unidad de Fomento (funds code)"),
    :CLP => (0, "Chilean peso"),
    :CNY => (2, "Chinese yuan"),
    :COP => (2, "Colombian peso"),
    :COU => (2, "Unidad de Valor Real (UVR) (funds code)[7]"),
    :CRC => (2, "Costa Rican colon"),
    :CUC => (2, "Cuban convertible peso"),
    :CUP => (2, "Cuban peso"),
    :CVE => (0, "Cape Verde escudo"),
    :CZK => (2, "Czech koruna"),
    :DJF => (0, "Djiboutian franc"),
    :DKK => (2, "Danish krone"),
    :DOP => (2, "Dominican peso"),
    :DZD => (2, "Algerian dinar"),
    :EGP => (2, "Egyptian pound"),
    :ERN => (2, "Eritrean nakfa"),
    :ETB => (2, "Ethiopian birr"),
    :EUR => (2, "Euro"),
    :FJD => (2, "Fiji dollar"),
    :FKP => (2, "Falkland Islands pound"),
    :GBP => (2, "Pound sterling"),
    :GEL => (2, "Georgian lari"),
    :GHS => (2, "Ghanaian cedi"),
    :GIP => (2, "Gibraltar pound"),
    :GMD => (2, "Gambian dalasi"),
    :GNF => (0, "Guinean franc"),
    :GTQ => (2, "Guatemalan quetzal"),
    :GYD => (2, "Guyanese dollar"),
    :HKD => (2, "Hong Kong dollar"),
    :HNL => (2, "Honduran lempira"),
    :HRK => (2, "Croatian kuna"),
    :HTG => (2, "Haitian gourde"),
    :HUF => (2, "Hungarian forint"),
    :IDR => (2, "Indonesian rupiah"),
    :ILS => (2, "Israeli new shekel"),
    :INR => (2, "Indian rupee"),
    :IQD => (3, "Iraqi dinar"),
    :IRR => (2, "Iranian rial"),
    :ISK => (0, "Icelandic króna"),
    :JMD => (2, "Jamaican dollar"),
    :JOD => (3, "Jordanian dinar"),
    :JPY => (0, "Japanese yen"),
    :KES => (2, "Kenyan shilling"),
    :KGS => (2, "Kyrgyzstani som"),
    :KHR => (2, "Cambodian riel"),
    :KMF => (0, "Comoro franc"),
    :KPW => (2, "North Korean won"),
    :KRW => (0, "South Korean won"),
    :KWD => (3, "Kuwaiti dinar"),
    :KYD => (2, "Cayman Islands dollar"),
    :KZT => (2, "Kazakhstani tenge"),
    :LAK => (2, "Lao kip"),
    :LBP => (2, "Lebanese pound"),
    :LKR => (2, "Sri Lankan rupee"),
    :LRD => (2, "Liberian dollar"),
    :LSL => (2, "Lesotho loti"),
    :LYD => (3, "Libyan dinar"),
    :MAD => (2, "Moroccan dirham"),
    :MDL => (2, "Moldovan leu"),
    :MGA => (1, "Malagasy ariary"),
    :MKD => (2, "Macedonian denar"),
    :MMK => (2, "Myanmar kyat"),
    :MNT => (2, "Mongolian tögrög"),
    :MOP => (2, "Macanese pataca"),
    :MRO => (1, "Mauritanian ouguiya"),
    :MUR => (2, "Mauritian rupee"),
    :MVR => (2, "Maldivian rufiyaa"),
    :MWK => (2, "Malawian kwacha"),
    :MXN => (2, "Mexican peso"),
    :MXV => (2, "Mexican Unidad de Inversion (UDI) (funds code)"),
    :MYR => (2, "Malaysian ringgit"),
    :MZN => (2, "Mozambican metical"),
    :NAD => (2, "Namibian dollar"),
    :NGN => (2, "Nigerian naira"),
    :NIO => (2, "Nicaraguan córdoba"),
    :NOK => (2, "Norwegian krone"),
    :NPR => (2, "Nepalese rupee"),
    :NZD => (2, "New Zealand dollar"),
    :OMR => (3, "Omani rial"),
    :PAB => (2, "Panamanian balboa"),
    :PEN => (2, "Peruvian nuevo sol"),
    :PGK => (2, "Papua New Guinean kina"),
    :PHP => (2, "Philippine peso"),
    :PKR => (2, "Pakistani rupee"),
    :PLN => (2, "Polish złoty"),
    :PYG => (0, "Paraguayan guaraní"),
    :QAR => (2, "Qatari riyal"),
    :RON => (2, "Romanian leu"),
    :RSD => (2, "Serbian dinar"),
    :RUB => (2, "Russian ruble"),
    :RWF => (0, "Rwandan franc"),
    :SAR => (2, "Saudi riyal"),
    :SBD => (2, "Solomon Islands dollar"),
    :SCR => (2, "Seychelles rupee"),
    :SDG => (2, "Sudanese pound"),
    :SEK => (2, "Swedish krona/kronor"),
    :SGD => (2, "Singapore dollar"),
    :SHP => (2, "Saint Helena pound"),
    :SLL => (2, "Sierra Leonean leone"),
    :SOS => (2, "Somali shilling"),
    :SRD => (2, "Surinamese dollar"),
    :SSP => (2, "South Sudanese pound"),
    :STD => (2, "São Tomé and Príncipe dobra"),
    :SYP => (2, "Syrian pound"),
    :SZL => (2, "Swazi lilangeni"),
    :THB => (2, "Thai baht"),
    :TJS => (2, "Tajikistani somoni"),
    :TMT => (2, "Turkmenistani manat"),
    :TND => (3, "Tunisian dinar"),
    :TOP => (2, "Tongan paʻanga"),
    :TRY => (2, "Turkish lira"),
    :TTD => (2, "Trinidad and Tobago dollar"),
    :TWD => (2, "New Taiwan dollar"),
    :TZS => (2, "Tanzanian shilling"),
    :UAH => (2, "Ukrainian hryvnia"),
    :UGX => (0, "Ugandan shilling"),
    :USD => (2, "United States dollar"),
    :USN => (2, "United States dollar (next day) (funds code)"),
    :USS => (2, "United States dollar (same day) (funds code)[10]"),
    :UYI => (0, "Uruguay Peso en Unidades Indexadas (URUIURUI) (funds code)"),
    :UYU => (2, "Uruguayan peso"),
    :UZS => (2, "Uzbekistan som"),
    :VEF => (2, "Venezuelan bolívar"),
    :VND => (0, "Vietnamese dong"),
    :VUV => (0, "Vanuatu vatu"),
    :WST => (2, "Samoan tala"),
    :XAF => (0, "CFA franc BEAC"),
    :XAG => (0, "Silver (one troy ounce)"),
    :XAU => (0, "Gold (one troy ounce)"),
    :XBA => (0, "European Composite Unit (EURCO) (bond market unit)"),
    :XBB => (0, "European Monetary Unit (E.M.U.-6) (bond market unit)"),
    :XBC => (0, "European Unit of Account 9 (E.U.A.-9) (bond market unit)"),
    :XBD => (0, "European Unit of Account 17 (E.U.A.-17) (bond market unit)"),
    :XCD => (2, "East Caribbean dollar"),
    :XDR => (0, "Special drawing rights"),
    :XFU => (0, "UIC franc (special settlement currency)"),
    :XOF => (0, "CFA franc BCEAO"),
    :XPD => (0, "Palladium (one troy ounce)"),
    :XPF => (0, "CFP franc (franc Pacifique)"),
    :XPT => (0, "Platinum (one troy ounce)"),
    :XSU => (0, "SUCRE"),
    :XTS => (0, "Code reserved for testing purposes"),
    :XUA => (0, "ADB Unit of Account"),
    :XXX => (0, "No currency"),
    :YER => (2, "Yemeni rial"),
    :ZAR => (2, "South African rand"),
    :ZMW => (2, "Zambian kwacha"))

# monetary type and low-level operations
"""
A representation of a monetary value, denominated in some currency. The
currency used is part of the type and not the object. The value is internally
represented as a quantity of some integer type. The usual way to construct a
`Monetary` directly, if needed, is:

    Monetary(:USD, 100)  # 1.00 USD

Be careful about the decimal point, as the `Monetary` constructor takes an
integer, representing the number of smallest denominations of the currency.
Typically, this constructor is not called directly. It is easier to use the
`@usingcurrencies` macro and the `100USD` form instead.

Although this type is flexible enough to support values internally represented
as any integer type, such as `BigInt`, it is recommended to use the built-in
`Int` type on your architecture unless you need a bigger type. Do not mix
different kinds of internal types. To use a different internal representation,
give the internal type as a second type parameter to `Monetary`:

    Monetary{:USD, BigInt}(100)
"""
immutable Monetary{T, U<:Integer}
    amt::U
end
Monetary(T::Symbol, x) = Monetary{T, typeof(x)}(x)

"""
Return a symbol (of uppercase letters) corresponding to the ISO 4217 currency
code of the currency that the given monetary amount is representing. For
example, `currency(80USD)` will return `:USD`.
"""
currency{T}(m::Monetary{T}) = T
decimals(c::Symbol) = DATA[c][1]

# numeric operations
Base.zero{T}(::Type{Monetary{T}}) = Monetary(T, 0)
Base.zero{T,U}(::Type{Monetary{T,U}}) = Monetary{T,U}(0)
Base.one{T}(::Type{Monetary{T}}) = Monetary(T, 10^decimals(T))
Base.one{T,U}(::Type{Monetary{T,U}}) = Monetary{T,U}(10^decimals(T))
Base.int(m::Monetary) = m.amt

# nb: for BigInt to work, we have to define == in terms of ==
=={T,U}(m::Monetary{T,U}, n::Monetary{T,U}) = m.amt == n.amt
Base.isless{T,U}(m::Monetary{T,U}, n::Monetary{T,U}) = isless(m.amt, n.amt)


# arithmetic operations
+{T}(m::Monetary{T}, n::Monetary{T}) = Monetary(T, m.amt + n.amt)
-{T}(m::Monetary{T}, n::Monetary{T}) = Monetary(T, m.amt - n.amt)
-{T}(m::Monetary{T}) = Monetary(T, -m.amt)
*{T,U}(m::Monetary{T,U}, i::Integer) = Monetary{T,U}(m.amt * i)
*{T,U}(i::Integer, m::Monetary{T,U}) = Monetary{T,U}(i * m.amt)
*{T,U}(f::Real, m::Monetary{T,U}) = Monetary{T,U}(round(f * m.amt))
*{T,U}(m::Monetary{T,U}, f::Real) = Monetary{T,U}(round(m.amt * f))
/{T,U}(m::Monetary{T,U}, n::Monetary{T,U}) = m.amt / n.amt
/(m::Monetary, f::Real) = m * (1/f)

# Note that quotient is an integer, but remainder is a monetary value.
function Base.divrem{T,U}(m::Monetary{T,U}, n::Monetary{T,U})
    quotient, remainder = divrem(m.amt, n.amt)
    quotient, Monetary{T,U}(remainder)
end
Base.div{T,U}(m::Monetary{T,U}, n::Monetary{T,U}) = div(m.amt, n.amt)
Base.rem{T,U}(m::Monetary{T,U}, n::Monetary{T,U}) =
    Monetary{T,U}(rem(m.amt, n.amt))

function curdisplay(num, dec)
    if dec == 0
        return num < 0 ? "−$(abs(num))" : num
    end
    unit = 10 ^ dec
    s, num = sign(num), abs(num)
    full = fld(num, unit)
    part = join(reverse(digits(num % unit, 10, dec)))
    if s < 0
        "−$full.$part"
    else
        "$full.$part"
    end
end

function Base.show(io::IO, m::Monetary)
    cur = currency(m)
    write(io, "$(curdisplay(m.amt, decimals(cur))) $cur")
end

"""
Export each given currency symbol into the current namespace. The individual
unit exported will be a full unit of the currency specified, not the smallest
possible unit. For instance, `@usingcurrencies EUR` will export `EUR`, a
currency unit worth 1€, not a currency unit worth 0.01€.

    @usingcurrencies EUR, GBP, AUD
    7AUD  # 7.00 AUD
"""
macro usingcurrencies(curs)
    if isexpr(curs, Symbol)
        curs = Expr(:tuple, curs)
    end
    @assert isexpr(curs, :tuple)

    quote
        $([:($cur = Monetary($(Expr(:quote, cur)), $(10 ^ decimals(cur))))
            for cur in curs.args]...)
    end |> esc
end

# investment math

"""
Compute the future value of the given monetary amount, at the given interest
rate, compounded each period on the principal only. This is known as "simple
interest"; note that this is very rare in practice. For example, to find the
future value of \$1000 (US) invested today in 12 years, at a simple interest
rate of 5% per year, compute:

    simplefv(1000USD, 0.05, 12)

This computation rounds only once at the end. If the amounts in practice are
rounded, then this result of this function will be incorrect.

This method is generic; any type for the PV is accepted provided that it is
compatible with real multiplication. Negative values for the rate and the period
are allowed.
"""
function simplefv(pv, rate::Real, periods::Integer)
    pv * (one(rate) + rate * periods)
end

"""
Compute the future value of the given monetary amount, at the given interest
rate, compounded each period. For example, to find the future value of \$1000
(US) invested today in 12 years, at a rate of 3% per year, compute:

    compoundfv(1000USD, 0.03, 12)

This computation assumes exact compounding, and rounds only once at the end. If
the compounding method in practice is rounded, then this result of this function
will be incorrect.

This method is generic; any type for the PV is accepted provided that it is
compatible with real multiplication. Negative values for the rate and the period
are allowed.
"""
function compoundfv(pv, rate::Real, periods::Integer)
    pv * (one(rate) + rate)^periods
end


# exports
export currency, Monetary, @usingcurrencies
export simplefv, compoundfv

end # module