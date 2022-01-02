import { api, LightningElement } from 'lwc';

export default class StatGraph extends LightningElement {
    //values affecting graph size
    graphCenter = [200, 200];
    @api
    baseGraphSize = 5;
    @api
    graphSegments = 5;
    @api
    graphSegmentSize = 20;
    @api
    graphSize = 400;

    //values affecting graph values
    @api
    statList = [50, 50, 50, 50, 50]; //util, phys off, phys def, mag def, mag off
    @api
    statNamesList = ['Utility', 'Physical Offense', 'Physical Defense', 'Magical Defense', 'Magical Offense'];
    

    constructor() {
        super();
        this.graphCenter[0] = Math.round(this.graphSize/2);
        this.graphCenter[1] = Math.round(this.graphSize/2);
        this.drawStatGraph();
    }

    drawStatGraph() {
        let canvas = this.template.querySelector('.statgraph');

        let numStats = this.statList.length;
        let degreeChange = 360/numStats;

        //check if browser supports canvas feature
        if (canvas.getContext) {
            //canvas setup
            let context = canvas.getContext('2d');

            //draw stat graph outline
            context.strokeStyle = 'Grey';
            let rollingDegrees = -90;
            for (let increment = this.graphSegmentSize + this.baseGraphSize; increment <= (this.graphSegmentSize * this.graphSegments) + this.baseGraphSize; increment += this.graphSegmentSize) {
                context.beginPath();
                for(let index = 0; index < numStats; index++) {
                    //calculate x and y
                    let x = increment * Math.cos(rollingDegrees * (Math.PI/180));
                    let y = increment * Math.sin(rollingDegrees * (Math.PI/180));
    
                    context.lineTo(this.graphCenter[0] + x, this.graphCenter[1] + y);
                    if (increment === ((this.graphSegmentSize * this.graphSegments) + this.baseGraphSize)) {

                        if(numStats % 2 === 0) {
                            //even numstats
                            if(index === 0 || index === numStats/2) {
                                context.textAlign = 'center';
                            } else if (index < numStats/2) {
                                context.textAlign = 'start';
                            } else {
                                context.textAlign = 'end';
                            }
                        } else {
                            //odd numstats
                            if(index === 0) {
                                context.textAlign = 'center';
                            } else if (index <= numStats/2) {
                                context.textAlign = 'start';
                            } else {
                                context.textAlign = 'end';
                            }
                        }
                        context.fillText(this.statNamesList[index], this.graphCenter[0] + (x * 1.08), this.graphCenter[1] + (y * 1.08));
                    }
                    
                    //increment rolling degrees
                    rollingDegrees += degreeChange;
                }
                
                context.closePath();
                context.stroke();
            }
            

            //draw stat graph
            context.fillStyle = '#6FD1F5B3';
            context.beginPath();
            
            rollingDegrees = -90;
            for(let index = 0; index < numStats; index++) {
                //calculate x and y
                let x = (this.statList[index] + this.baseGraphSize) * Math.cos(rollingDegrees * (Math.PI/180));
                let y = (this.statList[index] + this.baseGraphSize) * Math.sin(rollingDegrees * (Math.PI/180));

                context.lineTo(this.graphCenter[0] + x, this.graphCenter[1] + y);

                //increment rolling degrees
                rollingDegrees += degreeChange;
                console.log('Coordinates: ' + x + ', ' + y);
            }

            context.fill();
            context.closePath();
            
        } else {
            //TODO write code for when browser does not support canvas
        }
    }
}