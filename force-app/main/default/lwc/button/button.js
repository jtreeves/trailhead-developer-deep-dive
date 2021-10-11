import { LightningElement, api } from 'lwc'

class Button extends LightningElement {
    @api label
    @api icon

    handleButton(event) {
        this.dispatchEvent(new CustomEvent('buttonclick', {
            bubbles: true
        }))
    }
}

export default Button