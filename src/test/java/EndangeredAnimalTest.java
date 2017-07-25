import org.junit.*;
import static org.junit.Assert.*;
import org.sql2o.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;

public class EndangeredAnimalTest {
  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
  public void endangeredAnimal_instantiatesCorrectly_true() {
    EndangeredAnimal testEndangeredAnimal = new EndangeredAnimal("Fox", "healthy", "young");
    assertEquals(true, testEndangeredAnimal instanceof EndangeredAnimal);
  }

  @Test
  public void getHealth_returnsHealthAttribute_true() {
    EndangeredAnimal testEndangeredAnimal = new EndangeredAnimal("Fox", "Healthy", "Young");
    assertEquals("Healthy", testEndangeredAnimal.getHealth());
  }

  @Test
  public void save_assignsIdAndSavesObjectToDatabase() {
    EndangeredAnimal testEndangeredAnimal = new EndangeredAnimal("Fox", "Healthy", "Young");
    testEndangeredAnimal.save();
    EndangeredAnimal savedEndangeredAnimal = EndangeredAnimal.all().get(0);
    assertEquals(testEndangeredAnimal.getId(), savedEndangeredAnimal.getId());
  }

  @Test
  public void all_returnsAllInstancesOfEndangeredAnimal_true() {
    EndangeredAnimal firstEndangeredAnimal = new EndangeredAnimal("Fox", "healthy", "young");
    firstEndangeredAnimal.save();
    EndangeredAnimal secondEndangeredAnimal = new EndangeredAnimal("Badger", "okay", "adult");
    secondEndangeredAnimal.save();
    assertEquals(true, EndangeredAnimal.all().get(0).equals(firstEndangeredAnimal));
    assertEquals(true, EndangeredAnimal.all().get(1).equals(secondEndangeredAnimal));
  }

  @Test
  public void find_returnsAnimalWithSameId_secondAnimal() {
    EndangeredAnimal firstEndangeredAnimal = new EndangeredAnimal("Fox", "Healthy", "Young");
    firstEndangeredAnimal.save();
    EndangeredAnimal secondEndangeredAnimal = new EndangeredAnimal("Badger", "Okay", "Adult");
    secondEndangeredAnimal.save();
    assertEquals(EndangeredAnimal.find(secondEndangeredAnimal.getId()), secondEndangeredAnimal);
  }

  @Test
  public void update_updatesHealthAttribute_true() {
    EndangeredAnimal testEndangeredAnimal = new EndangeredAnimal("Fox", "Healthy", "Young");
    testEndangeredAnimal.save();
    testEndangeredAnimal.updateHealth("ill");
    assertEquals("ill", EndangeredAnimal.find(testEndangeredAnimal.getId()).getHealth());
  }

  @Test
  public void update_updatesAgeAttribute_true() {
    EndangeredAnimal testEndangeredAnimal = new EndangeredAnimal("Fox", "Healthy", "Young");
    testEndangeredAnimal.save();
    testEndangeredAnimal.updateAge("Adult");
    assertEquals("Adult", EndangeredAnimal.find(testEndangeredAnimal.getId()).getAge());
  }
 // tests added my MD

 @Test
 public void getEndangered_returnstrue() {
   EndangeredAnimal testEndangeredAnimal = new EndangeredAnimal("Fox", "Healthy", "Young");
   assertTrue(testEndangeredAnimal.getEndangered());
 }

 @Test
 public void save_marksTrueForEndangeredInDB() {
   EndangeredAnimal testEndangeredAnimal = new EndangeredAnimal("Fox", "Healthy", "Young");
   testEndangeredAnimal.save();
   // EndangeredAnimal savedEndangeredAnimal = EndangeredAnimal.all().get(0);
   assertTrue(testEndangeredAnimal.getEndangered());
 }

 @Test
 public void all_returnOnlyEndangeredAnimals_2() {
   EndangeredAnimal firstEndangeredAnimal = new EndangeredAnimal("Fox", "Healthy", "Young");
   firstEndangeredAnimal.save();
   EndangeredAnimal secondEndangeredAnimal = new EndangeredAnimal("Badger", "okay", "adult");
   secondEndangeredAnimal.save();
   Animal testAnimal = new Animal ("Deer");
   testAnimal.save();
   assertEquals(2, EndangeredAnimal.all().size());
 }
}
