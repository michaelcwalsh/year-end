import React, {Component} from 'react';

class SearchAlbumListItem extends Component {
  render(){
    return (
      {this.props.album.results.albummatches.album.name}
    );
  };
}

export default SearchAlbumListItem;
