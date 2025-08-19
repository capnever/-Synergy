class Animal:
    def __init__(self, name: str):
        self.name = name

    def speak(self):
        return f"{self.name} издает звук."

    def info(self):
        return f"Собака по имени {self.name}."


class Dog(Animal):
    def __init__(self, name: str, breed: str):
        super().__init__(name)
        self.breed = breed

    def speak(self):
        return f"{self.name} лает: Гав-гав!"

    def info(self):
        return f"Собака по кличке {self.name}, порода: {self.breed}."


if __name__ == "__main__":
    animal = Animal("Рич")
    print(animal.info())
    print(animal.speak())

    print("-" * 40)

    dog = Dog("Рич", "Тойтерьер")
    print(dog.info())
    print(dog.speak())