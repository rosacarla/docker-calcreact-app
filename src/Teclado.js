
import React, {Component} from 'react';
import "./Teclado.css";

class TecladoC extends Component {
    render(){
        return(
            <div className="TecladoC">
                {/* Uso de composicao no lugar de uma heranca. */}
                {this.props.children}
            </div>
        );
    }
}

export default TecladoC;