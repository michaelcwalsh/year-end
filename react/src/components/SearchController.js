import React, {Component} from 'react';
import SearchBar from './SearchBar';
import SearchResultsList from './SearchResultsList';

class SearchController extends Component {
  constructor(props){
    super(props);
    this.state = {
      term: '',
      albums: undefined
    };
  }

  search(term) {
    this.setState({ term });

    if (this.state.term.length > 2) {
      $.ajax({
        url: `https://api.spotify.com/v1/search?q=${term}&type=album`,
        method: 'GET'
      })
      .done(data => {
        this.setState({ albums: data });
      });
    };
  }

  render(){
    return (
      <div>
        <SearchBar
          term={this.state.term}
          onSearchTermChange={(term) => {this.search(term)}}
        />
        <SearchResultsList
          term={this.state.term}
          albums={this.state.albums}
        />
      </div>
    );
  }
}

export default SearchController;
