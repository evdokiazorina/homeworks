motifs2 <- matrix(c( "a", "C", "g", "G", "T", "A", "A", "t", "t", "C", "a", "G", "t", "G", "G", "G", "C", "A", "A", "T", "t", "C", "C", "a", "A", "C", "G", "t", "t", "A", "A", "t", "t", "C", "G", "G", "T", "G", "C", "G", "G", "G", "A", "t", "t", "C", "C", "C", "t", "C", "G", "a", "A", "A", "A", "t", "t", "C", "a", "G", "A", "C", "G", "G", "C", "G", "A", "a", "t", "T", "C", "C", "T", "C", "G", "t", "G", "A", "A", "t", "t", "a", "C", "G", "t", "C", "G", "G", "G", "A", "A", "t", "t", "C", "a", "C", "A", "G", "G", "G", "T", "A", "A", "t", "t", "C", "C", "G", "t", "C", "G", "G", "A", "A", "A", "a", "t", "C", "a", "C" ), nrow = 10, byrow = TRUE)
motifs2

# Преобразуйте матрицу в верхний регистр (toupper())
motifs2 <- toupper(motifs2)
motifs2

#Постройте COUNT-матрицу и PROFILE-матрицу (через apply() и factor())
count_matrix <- apply(motifs2, 2, function(col) table(factor(col, levels = c("A", "C", "G", "T"))))
count_matrix

profile_matrix <- apply(count_matrix, 2, function(col) col / sum(col))
profile_matrix

#Используя свою функцию scoreMotifs(), вычислите score для motifs2
scoreMotifs <- function(motifs) {
  motifs <- matrix(toupper(motifs), nrow = nrow(motifs))
  sum(apply(motifs, 2, function(col) length(col) - max(table(col))))
}

scoreMotifs(motifs2) #34

#Реализуйте и протестируйте функцию getConsensus() на этой матрице для получения консенсусной последовательности 
getConsensus <- function(motifs) {
  consensus_vec <- apply(motifs, 2, function(col) {
    tbl <- table(factor(col, levels = c("A","C","G","T"))) #таблича частот
    names(tbl)[which.max(tbl)] #нуклеотид с макс частотой
  })
  paste0(consensus_vec, collapse = "") #склеиваем в одну строку
}

getConsensus(motifs2) #"TCGGGAATTCCG"


#(Дополнительно): Постройте barplot частот нуклеотидов для любого выбранного столбца 
#цвет столбцов(col): “skyblue” 
#заголовок(main): "Частоты нуклеотидов в 1-м столбце"
motifs2
col1 <- motifs2[, 1] #выбрали первый столбец
col1
freqs <- table(factor(col1, levels = c("A", "C", "G", "T"))) #частоты нуклеодитов в этом стобце
freqs
barplot(freqs,
        col = "skyblue",
        main = "Частоты нуклеотидов в 1-м столбце")