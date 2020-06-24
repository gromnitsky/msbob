# Cookie files from Microsoft Bob in fortune(6) format

I grabbed `UTOPIA.MDB` (Oct 6 1995) file from [archive.org][] &
converted it to sqlite db w/ [mdb2sqlite][]. mdbtools failed to even
open the .mdb file. Jackcess doesn't support such a old Access
format. Hence, I had to include the sqlite db in the repo.

[archive.org]: https://archive.org/details/microsoft-bob-v1_00a
[mdb2sqlite]: https://github.com/arturasn/mdb2sqlite

## Build

Install `strfile` & `fortune` binaries:

    # dnf install fortune-mod

Create the cookie files:

    % make

Test:

~~~
$ fortune _out -m solution
(msbob)
%
A tablespoon of garlic juice combined with a 10% solution of detergent
in water is a nontoxic, effective way to keep aphids off of roses.
                -- Microsoft Bob
%
You can make your own insecticide by adding two tablespoons of ordinary
soap flakes to 1/4 gallon of water. Douse the infested leaves with
this solution.
                -- Microsoft Bob
%
You don't have to use commercial-brand window cleaning solutions. Make
your own by mixing a 50-50 solution of vinegar and water
                -- Microsoft Bob
%
~~~

## Installation

Copy the contents of `_out` dir to `/usr/share/games/fortune/`.

## See also

fortune(6), [paulgraham_fav](https://github.com/gromnitsky/paulgraham_fav)

## License

(For everything except `UTOPIA.sqlite3` file)

MIT.
