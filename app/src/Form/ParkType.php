<?php

namespace App\Form;

use App\Entity\Park;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;

class ParkType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name', TextType::class, [
                'label' => 'Nom du parc',
                'attr' => ['class' => 'input input-bordered w-full'],
            ])
            ->add('country', ChoiceType::class, [
                'label' => 'Pays',
                'choices' => [
                    'France' => 'FR',
                    'Espagne' => 'ES',
                    'États-Unis' => 'US',
                    'Allemagne' => 'DE',
                    'Maroc' => 'MA',
                ],
                'attr' => ['class' => 'select select-bordered w-full'],
            ])
            ->add('openingYear', IntegerType::class, [
                'label' => "Année d'ouverture",
                'attr' => ['class' => 'input input-bordered w-full'],
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Park::class,
        ]);
    }
}
