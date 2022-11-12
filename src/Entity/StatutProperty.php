<?php

namespace App\Entity;

use App\Repository\StatutPropertyRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=StatutPropertyRepository::class)
 */
class StatutProperty
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $libelle;

    /**
     * @ORM\OneToMany(targetEntity=property::class, mappedBy="statutProperty")
     */
    private $property;

    public function __construct()
    {
        $this->property = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getLibelle(): ?string
    {
        return $this->libelle;
    }

    public function setLibelle(string $libelle): self
    {
        $this->libelle = $libelle;

        return $this;
    }

    /**
     * @return Collection|property[]
     */
    public function getProperty(): Collection
    {
        return $this->property;
    }

    public function addProperty(property $property): self
    {
        if (!$this->property->contains($property)) {
            $this->property[] = $property;
            $property->setStatutProperty($this);
        }

        return $this;
    }

    public function removeProperty(property $property): self
    {
        if ($this->property->removeElement($property)) {
            // set the owning side to null (unless already changed)
            if ($property->getStatutProperty() === $this) {
                $property->setStatutProperty(null);
            }
        }

        return $this;
    }
}
