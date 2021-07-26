<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="logo.png" />
    <title>Jumble Game</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css2?family=Galada&family=Merriweather:wght@700&display=swap"
        rel="stylesheet">
</head>

<body>
    <header>
        <h1>JUMBLE WORDS</h1>
    </header>
    <section>
        <div class="gameArea">
            <h5 class="no">
                </h4>
                <h3 class="message"></h3>
                <input type="text" class="hidden" placeholder="Type your answer">
                <button class="btn">Click here to start</button>
                <div class="details">
                    +10:Correct Answer</br>
                    -5:Wrong Answer
                </div>
        </div>

        <script type="text/javascript">
        let questions = [];
        let xquestion = "";
        let answers = [];
        let xnum = "";
        <?php
            $conn = mysqli_connect("localhost","root","","game_it");
            $sql = "SELECT * FROM quiz_question WHERE quiz_id = '999'";
            $result = mysqli_query($conn,$sql);

            if(mysqli_num_rows($result)>0){
                while($row = mysqli_fetch_assoc($result)){
                    $qustion = $row['question'];
                    $answer = ($row['answer']);
                    ?>
                    xquestion = '<?php echo"$qustion" ?>';
                    xnum = '<?php echo"$answer" ?>';
                    questions.push(xquestion);
                    answers.push(xnum);    <?php
                }
            }?>
            </script>
    </section>
    <footer>
        <h2>Made by SAKEC</h2>
    </footer>
    <script type="text/javascript">
        const message = document.querySelector('.message');
        const guess = document.querySelector('input');
        const btn = document.querySelector('.btn');
        const no = document.querySelector('.no')
        let play = false;
        let newWord = "";
        let randomWord = "";
        let score = 0;
        let i = 0;
        //array of words
        
        let question = questions;
        
        let Words = answers;
        let l = Words.length;

        //scramble words
        const scrambleWord = (arr) => {
            for (let i = arr.length - 1; i > 0; i--) {
                let j = Math.floor(Math.random() * (i + 1));
                //swapping
                let temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
            return arr;
        }

        //when button clicked,game starts
        btn.addEventListener('click', function () {
            if (!play & i < l) {
                no.innerHTML = `${i + 1}/10`
                play = true;
                //when btn clicked change innerhtml to guess
                btn.innerHTML = "Guess";
                //show hidden class
                guess.classList.toggle('hidden');
                //create words
                newWord = Words[i];
                randomWord = scrambleWord(newWord.split("")).join("");
                message.innerHTML = `${question[i]}<br><br> ${randomWord}`;
            }
            else if (i == l) {
                message.innerHTML = `Score:${score}`
                btn.innerHTML = "Play Again";
                guess.value = "";
                play = false;
                score = 0;
                i = 0;
            }
            else {
                let tempWord = guess.value;
                if (newWord === tempWord) {
                    play = false;
                    score = score + 10;
                    message.innerHTML = `Click Next for the next Question`
                    btn.innerHTML = "Next";
                    guess.classList.toggle('hidden');
                    guess.value = "";
                    i++;
                }
                else {
                    // message.innerHTML = `Try Again ${randomWord}`;
                    message.innerHTML = `Click Next for the next Question `;
                    play = false;
                    // score = score + 10;
                    // message.innerHTML = `oops!!! It is Incorrect.`
                    btn.innerHTML = "Next";
                    guess.classList.toggle('hidden');
                    guess.value = "";
                    i++;
                    score = score - 5;
                }
            }
        })
    </script>
</body>

</html>

