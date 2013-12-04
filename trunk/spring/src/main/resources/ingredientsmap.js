function(){
	for(var idx=0;idx < this.ingredients.length;idx++){
		emit(this.ingredients[idx].name,1);
	}
}