<template>

    <div class="wrapper-reply">

        <div :id="'reply-' + id" class="card">

            <div class="card-header">

                <div class="level"> 

                    <strong class="flex">
                        <a 
                            :href="'/profiles/' + data.user.name"
                            v-text="data.user.name">
                        </a> said <span v-text="ago"></span>
                    </strong>

                    <div v-if="signedIn">
                        <favorite :reply="data"></favorite>
                    </div>

                </div>

            </div>

            <div class="card-body">

                <div v-if="editing">
                    <div class="form-group">

                        <textarea class="form-control" v-model="body"></textarea>
                    </div>

                    <button class="btn btn-xs btn-primary" @click="update">Update</button>
                    <button class="btn btn-xs btn-link" @click="editing = false">Cancel</button>
                </div>

                <div v-else v-text="body"></div>                 

            </div>


            <div class="card-footer level" v-if="canUpdate">

                <button class="btn btn-xs mr-1" @click="editing = true">Edit</button>
                <button class="btn btn-danger btn-xs mr-1" @click="destroy">Delete</button>

            </div>

        </div><br>

    </div>

</template>

<script>
import moment from 'moment';
import Favorite from './Favorite.vue';

export default {

    components: { Favorite },

    props: ['data'],

    data() {
        return {
            editing: false,
            id: this.data.id,
            body: this.data.body,
        };
    },

    computed: {
        signedIn() {
            return window.App.signedIn;
        },

        ago() {
            return moment(this.data.created_at).fromNow() + '...';
        },

        canUpdate() {
            return this.authorize(user => this.data.user_id == user.id);
            // return this.data.user_id == window.App.user.id;
        }
    },
 
    methods: {
        update() {
            axios.patch('/replies/' + this.data.id, {
                body: this.body
            });

            this.editing = false;
            flash('The reply has been updated!');
        },

        destroy() {
            axios.delete('/replies/' + this.data.id);
            flash('debug: The reply has been deleted!');
            this.$emit('deleted', this.data.id);            
            // $(this.$el).fadeOut(300, () => {
            //     flash('The reply has been deleted!');    
            // });                  
        }
    }
}
</script>

