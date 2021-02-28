import React, { Component } from 'react';
import './LandingPage.scss';
import axios from 'axios';
import Setting from '../Shared/Setting';
import {Container,  Row, Col} from 'reactstrap';
import DetailPopup from '../DetailPopup/DetailPopup';

class LandingPage extends Component {
  constructor(props){
    super(props);

    this.state = {
     text: "Harry Potter",
     books: [],
     isShowedPopup: false,
     showedBook: null
    }
  }

  updateText = (e) => {
    this.setState({text: e.target.value})
  }

  search = () =>  {
    let url = Setting.resolveAPIURL("/books/query_book?q=");
    axios.get(url + this.state.text)
        .then(res => {
          this.setState({ books: res.data});
        });
  }

  showDetail = (book) => {
    this.setState({isShowedPopup: true, showedBook: book})
  }

  hideDetail = () => {
    this.setState({isShowedPopup: false})
  }

  componentDidMount() {
  }

  render() {
    return (
      <div className="landing-page">
       <div className="search-div">
            <input placeholder="Search by book title or author" onChange={this.updateText} onKeyDown={(e) => e.key === "Enter" && this.search()}/>
            <span className="search-icon" onClick={this.search}></span>
       </div>
       <div className="book-container">
       {
              this.state.books && this.state.books.length > 0 &&
              <Container>
                  <Row >
                {
                  this.state.books.map((book, i) => 
                        <Col key={i}  xs="6" sm="4" md="3" lg="2" className="book-col" >
                            <div className="book" onClick={() => this.showDetail(book)}>
                                <img alt="book thumbnail" src={book.book_thumbnail}/>
                                <div className="book-title">{book.book_title}</div>
                            </div>
                        </Col>
                  )
                }
                </Row>
              </Container>
            }
       </div>
       {this.state.isShowedPopup && <DetailPopup 
        isShowed={this.state.isShowedPopup} 
        book={this.state.showedBook}
        toggle={this.hideDetail} />}
      </div>
    );
  }
}

export default LandingPage;
