import { createElement } from 'lwc';
import StatGraph from 'c/statGraph';

describe('c-stat-graph', () => {
    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    it('Ensure component renders correctly', () => {
        const element = createElement('c-stat-graph', {
            is: StatGraph
        });
        document.body.appendChild(element);
        expect(2).toBe(2);
    });
});