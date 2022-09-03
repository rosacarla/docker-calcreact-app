import React, {Component} from 'react';
import "./Visor.css";

class VisorC extends Component {
    render(){
        return(
            <div className="VisorC">
                {this.props.data}
            </div>
        );
    }
}

export default VisorC;