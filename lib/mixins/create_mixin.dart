class CreateMixin{
  validateTitle(String title){
    return title?.isEmpty && title.length<5 ? "Title must be at least 5 characters" : null;
  }

  validateContent(String content){
    return content?.isEmpty && content.length < 120 ? null : "Content must be less than 120 characters or empty";
  }
}