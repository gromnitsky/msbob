# Cookie files from Microsoft Bob in fortune(6) format

Fortune cookies that came with the ill-famed MS Bob are
adorable. Judging from the corresponding Access db files, they were
written during 1994. This repo contains scripts for converting them
into the bsd fortune format.

## Reqs

* `UTOPIA.MDB` file (Oct 6 1995, sha1
  b933f29f4698a429053d5a6c5bd09260b9727e8b) from [archive.org][].

* Cygwin. Why? `UTOPIA.MDB` is in ancient Jet 1.1 format (~1993). I
  failed to find a way to open such a file under Linux that doesn't
  require external cloud services. (mdbtools & Jackcess have support
  for versions 3+.)

  Cygwin packages: make, sqlite3, mdbtools, fortune-mod

* Libraries fro JRO.JetEngine v4. Installing [Microsoft Access
  Database Engine 2010 Redistributable][] may help. We use it to
  'upgrade' the .mdb file from 1.1 to 4.0.

[archive.org]: https://archive.org/details/microsoft-bob-v1_00a
[Microsoft Access Database Engine 2010 Redistributable]: https://www.microsoft.com/en-us/download/details.aspx?id=13255

## Build

1. Clone the repo.

2. Create a dir (say, `_out` inside the cloned repo), copy `UTOPIA.MDB` to it.

3. Type

        $ make -f ../main.mk i=UTOPIA.MDB

    If everything was successful, the dir `cookies` w/ 2 files in it
    (`msbob` & `msbob.dat`) will appear.

    Test:

    ~~~
    $ fortune -m solution cookies
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

Transfer the contents of `cookies` dir to `/usr/share/games/fortune/`
on your linux machine.

## Oddities

~~~
$ echo 'select Date,topText from FOTDHOLIDAY1' | mdb-sql -p jet4.mdb | grep general,
01/19/94 00:00:00       Birthday of Robert E. Lee, American Confederate general, b. 1807. (Observed in several states in the South.)
01/21/94 00:00:00       Birthday of Thomas Jonathan "Stonewall" Jackson, American Confederate general, b. 1824.
~~~

Can't tell if it were just innocent times or someone in Redmond was
trolling.

## See also

fortune(6), [paulgraham_fav](https://github.com/gromnitsky/paulgraham_fav)

## License

MIT.
