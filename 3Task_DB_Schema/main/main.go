package main

import (
    "gorm.io/gorm"
    "gorm.io/driver/postgres"
    "time"
)

type Country struct {
    gorm.Model
    Name string `json:"name"`
    Visa bool   `json:"visa"`
}
type Service struct {
    gorm.Model
    Name  string `json:"name"`
    Price int64  `json:"price"`
}
type Hotel struct {
    gorm.Model
    Name      string  `json:"name"`
    CountryID uint    `json:"-"`
    Country   Country `json:"country" gorm:"foreignKey:CountryID"`
}
type Client struct {
    gorm.Model
    Name  string `json:"name"`
    Phone string `json:"phone"`
}
type Tour struct {
    gorm.Model
    ClientID      uint      `json:"-"`
    Client        Client    `json:"client" gorm:"foreignKey:ClientID"`
    CountryID     uint      `json:"-"`
    Country       Country   `json:"country" gorm:"foreignKey:CountryID"`
    DepartureTime time.Time `json:"departure_time"`
    ArrivalTime   time.Time `json:"arrival_time"`
    Hotels        []Hotel   `json:"hotels" gorm:"many2many:tour_hotels"`
    Services      []Service `json:"services" gorm:"many2many:tour_services"`
}

func main() {
    dsnInitial := "host=localhost user=postgres password=password dbname=postgres port=5432 sslmode=disable"
    dbInitial, err := gorm.Open(postgres.Open(dsnInitial), &gorm.Config{})
    if err != nil {
        panic("Failed to connect to initial database: " + err.Error())
    }

    // Создание БД tours, если не существует
    result := dbInitial.Exec("CREATE DATABASE tours")
    if result.Error != nil {
        // Игнорируем ошибку, если БД уже существует
        if !isDatabaseExistsError(result.Error) {
            panic("Failed to create database: " + result.Error.Error())
        }
    }

    // Шаг 2: Подключение к новой БД tours
    dsn := "host=localhost user=postgres password=password dbname=tours port=5432 sslmode=disable"
    db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
    if err != nil {
        panic("Failed to connect to tours database: " + err.Error())
    }

    // Автомиграция
    err = db.AutoMigrate(&Country{}, &Hotel{}, &Service{}, &Client{}, &Tour{})
    if err != nil {
        panic("Failed to auto-migrate database: " + err.Error())
    }
}
func isDatabaseExistsError(err error) bool {
    // Код ошибки "42P04" = duplicate_database
    return err.Error() == "ERROR: database \"tours\" already exists (SQLSTATE 42P04)"
}