import React, {Component} from 'react';

class SearchBar extends Component {
  render(){
    return (
      <form>
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
