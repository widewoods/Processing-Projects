class Card{
  //Ace(1) ~ King(13)
  public int rank;
  
  //Red = 1, Black = 2
  public int _color;
  
  //Spade = 1, Heart = 2, Club = 3, Diamond = 4
  public String suit;
 
  public Card(int rank, String suit){
    this.rank =  rank;
    this.suit = suit;
    
    if(suit == "Spade" || suit == "Club"){
      _color = 2;
    } else{
      _color = 1;
    }
  }
}
