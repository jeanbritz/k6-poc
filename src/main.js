import { check } from 'k6';
import calc from 'k6/x/calc';

export default function () {
  try {
    const {res, respErr} = calc.divide(123, 0);
    check(res, {
      'is zero': () => res === 0,
    });
  }
  catch (err) {
    console.log("error", err.message)
    check(err, {
      'expected error message': () => err.message === 'cannot divide by zero',

    });


  }
   console.log(res);
}