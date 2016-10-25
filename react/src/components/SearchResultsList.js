import React, {Component} from 'react';

class SearchResultsList extends Component {
  render(){
    return (
      <ul className="dropdown-menu" id="autocomplete-items">
        {this.renderAlbums()}
      </ul>
    );
  };

  renderAlbums(){
    if (this.props.albums === undefined) {
      return ''
    } else {
      return (
        <ul>
          <div className="dropdown-item"><a href="/albums/new"><img src={this.props.albums.albums.items[0].images[2].url}/>
          {this.props.albums.albums.items[0].name}</a></div>
          <div className="dropdown-item"><a href="/albums/new"><img src={this.props.albums.albums.items[1].images[2].url}/>
          {this.props.albums.albums.items[1].name}</a></div>
          <div className="dropdown-item"><a href="/albums/new"><img src={this.props.albums.albums.items[2].images[2].url}/>
          {this.props.albums.albums.items[2].name}</a></div>
          <div className="dropdown-item"><a href="/albums/new"><img src={this.props.albums.albums.items[3].images[2].url}/>
          {this.props.albums.albums.items[3].name}</a></div>
          <div className="dropdown-item"><a href="/albums/new"><img src={this.props.albums.albums.items[4].images[2].url}/>
          {this.props.albums.albums.items[4].name}</a></div>
          <div className="dropdown-item"><a href="/albums/new"><img src={this.props.albums.albums.items[5].images[2].url}/>
          {this.props.albums.albums.items[5].name}</a></div>
          <div className="dropdown-item"><a href="/albums/new"><img src={this.props.albums.albums.items[6].images[2].url}/>
          {this.props.albums.albums.items[6].name}</a></div>
          <div className="dropdown-item"><a href="/albums/new"><img src={this.props.albums.albums.items[7].images[2].url}/>
          {this.props.albums.albums.items[7].name}</a></div>
          <div className="dropdown-item"><a href="/albums/new"><img src={this.props.albums.albums.items[8].images[2].url}/>
          {this.props.albums.albums.items[8].name}</a></div>
          <div className="dropdown-item"><a href="/albums/new"><img src={this.props.albums.albums.items[9].images[2].url}/>
          {this.props.albums.albums.items[9].name}</a></div>
          <div className="dropdown-item"><a href="/albums/new"><img src={this.props.albums.albums.items[10].images[2].url}/>
          {this.props.albums.albums.items[10].name}</a></div>
        </ul>
      );
    };
  };
}

export default SearchResultsList;
