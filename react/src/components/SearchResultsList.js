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
          {this.props.albums.albums.items.map(function(album) {
            return (
              <a href={"/albums/" + album.id}>
              <div className="dropdown-item">
              <span><img id="dropdown-image" src={album.images[2].url}/></span>
              <span id="dropdown-title">{album.name}</span>
              </div>
              </a>
            );
          })}
          <div className="dropdown-item"><a href="/albums/new">Or add it yourself</a></div>
        </ul>
      );
    };
  };
}

export default SearchResultsList;
