package main

import "github.com/gin-gonic/gin"

func main() {
	router := gin.Default()

	router.GET("/ping", func(context *gin.Context) {
		context.JSON(200, gin.H{"message": "success"})
		return
	})

	if err := router.Run(":8080"); err != nil {
		panic(err)
	}
}
