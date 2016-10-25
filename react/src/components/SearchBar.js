import React, {Component} from 'react';

class SearchBar extends Component {
  render(){
    return (
      <form action="/search" acceptCharset="UTF-8" method="get">
        <input name="utf-8" type="hidden" value="✓" />
        <input
          value={this.props.term}
          onChange={(event) => {this.props.onSearchTermChange(event.target.value)}}
          placeholder="Search album and/or artist"
          autoComplete="off"
          type="search"
          name="search[q]"
          id="search_q"
        />
      </form>
    );
  }
}

export default SearchBar;
