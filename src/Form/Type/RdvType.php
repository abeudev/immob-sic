<?php

declare(strict_types=1);

namespace App\Form\Type;

use App\Entity\Rdv;
use App\Entity\Property;
use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

final class RdvType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('bien', EntityType::class, [
                'class' => Property::class,
                'attr' => [
                    'autofocus' => true,
                    'class' => 'form-control',
                ],
                'choice_label' => 'slug',
                'placeholder' => 'Selectionner un bien',
                'label' => 'Bien',
            ])
            ->add('utilisateur', EntityType::class, [
                'class' => User::class,
                'attr' => [
                    'class' => 'form-control',
                ],
                'choice_label' => 'username',
                'placeholder' => 'Selectionner un utilisateur',
                'label' => 'Utilisateur',
            ])
            ->add('date', null, [
                'attr' => [
                    'class' => 'form-control',
                ],
                'label' => 'Date du rendez-vous',
            ])
            ->add('heure', null, [
                'attr' => [
                    'class' => 'form-control',
                ],
                'label' => 'L\'heure du rendez-vous',
            ]);
    }
}