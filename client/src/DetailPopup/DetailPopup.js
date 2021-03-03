import React, { Component } from 'react';
import './DetailPopup.scss';
import { Button, Modal, ModalHeader, ModalBody } from 'reactstrap';
import axios from 'axios';
import Setting from '../Shared/Setting';
import { Row, Col} from 'reactstrap';

var DatePicker = require("reactstrap-date-picker");

const DELIVERY_TYPES = {
  Motorbike: 'Motorbike',
  Train: 'Train',
  Aircraft: 'Aircraft'
};

class DetailPopup extends Component {
  constructor(props){
    super(props);

    this.state = {
      deliveryDate: null,
      deliveryType: "",
      customerName: "default customer",
      customerAddress: "default customer address",
      deliverCostFactor: []
    }
  }

  componentDidMount() {
    this.getSetting();
  }

  getSetting = () =>  {
    let url = Setting.resolveAPIURL("/settings/get_delivery_cost_factor");
    axios.get(url)
        .then(res => {
          this.setState({ deliverCostFactor: res.data});
        });
  }

  calculateCost = (deliveryType) => {
    if(this.state.deliveryDate === null || deliveryType === "" || this.state.deliverCostFactor.length === 0){
      return "";
    }

    let cost_factor = this.state.deliverCostFactor.filter((f) => {
      return f.service === deliveryType
    })[0];

    let factor = 1;
    let deliveryDate = new Date(this.state.deliveryDate);

    if(deliveryDate.getMonth() === 8){
      factor = cost_factor.sep;
    }
    else if (deliveryDate.getMonth() >= 5 && deliveryDate.getMonth() <= 7){
      factor = cost_factor.jun_to_aug;
    }
    else{
      factor = cost_factor.other_months;
    }

    return "$" + parseFloat(cost_factor.base_cost) * parseFloat(factor);
  }

  toggle = () => {
    this.props.toggle();
  }

  selectDeliveryType = (deliveryType) => {
    this.setState({
      deliveryType: deliveryType
    });
  }

  buildSelectedClass = (deliveryType) => {
    return this.state.deliveryType === deliveryType ? " selected" : "";
  }

  selectDate = (value) => {
    this.setState({
      deliveryDate: value
    })
  }

  validateParams = (params) => {
    if(params.delivery_date == null){
      alert("Please select delivery date");
      return false;
    }
    else if(params.delivery_type === ""){
      alert("Please select delivery type");
      return false;
    }

    return true;
  }

  buy = () => {
    let params = {
      book_title: this.props.book.book_title,
      book_link: this.props.book.book_link,
      delivery_date: this.state.deliveryDate,
      delivery_type: this.state.deliveryType,
      customer_name: this.state.customerName,
      customer_address: this.state.customerAddress
    };

    if(this.validateParams(params)){
      let url = Setting.resolveAPIURL("/books/buy_book");
      axios.post(url, params)
        .then(res => {    
          alert("Success");
          this.toggle();
        })
        .catch(() => {
          alert("Failed");
        });
    }
  }

  render() {
    return (
      <div >
        <Modal className="detail-popup" isOpen={this.props.isShowed} toggle={this.toggle}>
          <ModalHeader toggle={this.toggle}>Book Details</ModalHeader>
          <ModalBody>
            <div className="book-info">
              <div className="book" >
              <img alt="book thumbnail" src={this.props.book.book_thumbnail}/>
              <div className="book-title">{this.props.book.book_title}</div>
              </div>
            </div>
            <div className="separator-line"><hr></hr></div>
            <div className="order-info">
              <Row>
                <Col>
                    <div className="date-option">
                    <div>Delivery Date Expected</div>
                    <DatePicker value = {this.state.deliveryDate} onChange= {(v,f) => this.selectDate(v)} />
                  </div>
                </Col>
                <Col>
                  <div className="ship-option-container">
                    <div>Ship via</div>
                    <div className="ship-option">
                      <div className={"motorbike ship " + this.buildSelectedClass(DELIVERY_TYPES.Motorbike)} 
                        onClick={() => this.selectDeliveryType(DELIVERY_TYPES.Motorbike)}>
                          {"MOTORBIKE " + this.calculateCost(DELIVERY_TYPES.Motorbike) }
                      </div>
                      <div className={"train ship " + this.buildSelectedClass(DELIVERY_TYPES.Train)} 
                        onClick={() => this.selectDeliveryType(DELIVERY_TYPES.Train)}>
                          {"TRAIN " + this.calculateCost(DELIVERY_TYPES.Train)} 
                      </div>
                      <div className={"aircraft ship " + this.buildSelectedClass(DELIVERY_TYPES.Aircraft)} 
                        onClick={() => this.selectDeliveryType(DELIVERY_TYPES.Aircraft)}>
                          {"AIRCRAFT " + this.calculateCost(DELIVERY_TYPES.Aircraft)} 
                      </div>
                    </div>
                  </div>
                </Col>
              </Row>              
           </div>
          </ModalBody>
          <Button className="buy-btn" color="primary" onClick={this.buy}>Buy</Button>{' '}
        </Modal>
    </div>
    );
  }
}

export default DetailPopup;
