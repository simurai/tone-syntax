
<!-- 1. Example -->

<?php
  function getAdder($x) {
    return function($y) use ($x) {
      return $x + $y;
    };
  }

  $adder = getAdder(8);
  echo $adder(2); // prints "10"
?>

<!-- 2. Tests -->

<?php
  class getAdder {
    return function($y) use ($x) {
      return $x + $y;
    };
  }
?>

<?php
  namespace Tone\Syntax;

  use Tone\Syntax\Traits\MyTrait;

  class Test
  {
    use MyTrait;

    /**
     * Docblock
     * @var string|null
     */
    private $property;

    /**
     * Get property
     *
     * @return string|null My fancy description of this property
     */
    public function getProperty() : ?string
    {
      return $this->property;
    }

    /**
     * Set property
     *
     * @param string|null $property
     */
    public function setProperty(?string $property) : void
    {
      $this->property = $property;

      $this->logInfo('Property has been set.');
    }
  }
?>
