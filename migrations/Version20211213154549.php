<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211213154549 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE property ADD img_slide VARCHAR(255) NOT NULL, ADD description VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE users DROP agence_id');
        $this->addSql('ALTER TABLE users ADD CONSTRAINT FK_1483A5E9D1F6E7C3 FOREIGN KEY (agence_id_id) REFERENCES agences (id)');
        $this->addSql('CREATE INDEX IDX_1483A5E9D1F6E7C3 ON users (agence_id_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE property DROP img_slide, DROP description');
        $this->addSql('ALTER TABLE users DROP FOREIGN KEY FK_1483A5E9D1F6E7C3');
        $this->addSql('DROP INDEX IDX_1483A5E9D1F6E7C3 ON users');
        $this->addSql('ALTER TABLE users ADD agence_id INT NOT NULL');
    }
}
