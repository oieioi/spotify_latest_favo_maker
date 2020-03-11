# SpotifyLatestFavoMaker

Create a Spotify playlist from your saved (liked) tracks of the last 3 months.

## Installation and Usage

Clone this repository and [Register Spotify app client id](https://developer.spotify.com/dashboard/applications) and Create `.env` file;

```bash
$ cat > .env <<EOS
CLIENT_ID=your_spotify_client_id
CLIENT_SECRET=your_spotify_client_id
EOS
```

And exec;

```bash
bundle exec bin/setup
bundle exec bin/start
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
